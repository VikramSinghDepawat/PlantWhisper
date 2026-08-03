//
//  OpenAIDataSource.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

final class OpenAIDataSource: AIDataSource {
    
    private let service: OpenAIService
    private let configuration: OpenAIAPIConfiguration
    private let requestBuilder: OpenAIRequestBuilder
    
    init(
        service: OpenAIService,
        configuration: OpenAIAPIConfiguration,
        requestBuilder: OpenAIRequestBuilder = OpenAIRequestBuilder()
    ) {
        self.service = service
        self.configuration = configuration
        self.requestBuilder = requestBuilder
    }
    
    // MARK: - Plant Identification
    
    func identifyPlant(
        from imageData: Data
    ) async throws -> PlantIdentificationDTO {
        
        let request = requestBuilder.build(
            imageData: imageData,
            systemPrompt: PlantPrompts.identification,
            configuration: configuration,
            schema: PlantIdentificationSchema()
        )
        
        let response = try await service.execute(request)
        
        guard let json = response.outputText else {
            throw OpenAIDataSourceError.emptyResponse
        }
        
        return try OpenAIResponseParser.decode(
            PlantIdentificationDTO.self,
            from: json
        )
    }
    
    // MARK: - Disease Detection
    
    func detectDisease(
        from imageData: Data
    ) async throws -> DiseaseDetectionDTO {
        
        let request = requestBuilder.build(
            imageData: imageData,
            systemPrompt: PlantPrompts.diseaseDetection,
            configuration: configuration,
            schema: DiseaseDetectionSchema()
        )
        
        let response = try await service.execute(request)
        
        guard let json = response.outputText else {
            throw OpenAIDataSourceError.emptyResponse
        }
        
        return try OpenAIResponseParser.decode(
            DiseaseDetectionDTO.self,
            from: json
        )
    }
    
    // MARK: - Care Tips
    
    func generateCareTips(
        for plant: PlantIdentificationDTO
    ) async throws -> CareTipsDTO {
        
        let prompt = PlantPrompts.careTips(for: plant)
        
        let request = requestBuilder.build(
            imageData: Data(),
            systemPrompt: prompt,
            configuration: configuration,
            schema: CareTipsSchema()
        )
        
        let response = try await service.execute(request)
        
        guard let json = response.outputText else {
            throw OpenAIDataSourceError.emptyResponse
        }
        
        return try OpenAIResponseParser.decode(
            CareTipsDTO.self,
            from: json
        )
    }
}


enum OpenAIDataSourceError: LocalizedError {
    
    case emptyResponse
    
    var errorDescription: String? {
        switch self {
        case .emptyResponse:
            return "The AI model returned an empty response."
        }
    }
}
