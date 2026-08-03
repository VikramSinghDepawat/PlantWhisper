//
//  DetectDiseaseUseCase.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol DetectDiseaseUseCase: Sendable {
    
    /// Detects a disease from image data.
    ///
    /// - Parameter imageData: JPEG or HEIF image data.
    /// - Returns: The detected disease.
    func execute(imageData: Data) async throws -> PlantDisease
}

struct DefaultDetectDiseaseUseCase: DetectDiseaseUseCase, Sendable {
    
    private let repository: PlantRepository
    
    init(repository: PlantRepository) {
        self.repository = repository
    }
    
    func execute(imageData: Data) async throws -> PlantDisease {
        
        guard !imageData.isEmpty else {
            throw DomainError.invalidInput
        }
        
        return try await repository.detectDisease(from: imageData)
    }
}
