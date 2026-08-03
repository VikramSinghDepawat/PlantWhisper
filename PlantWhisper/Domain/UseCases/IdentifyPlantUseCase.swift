//
//  IdentifyPlantUseCase.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol IdentifyPlantUseCase: Sendable {
    
    /// Identifies a plant from image data.
    ///
    /// - Parameter imageData: JPEG or HEIF image data.
    /// - Returns: A successfully identified plant.
    func execute(imageData: Data) async throws -> Plant
}

struct DefaultIdentifyPlantUseCase: IdentifyPlantUseCase, Sendable {
    
    private let repository: PlantAIRepository
    
    init(repository: PlantAIRepository) {
        self.repository = repository
    }
    
    func execute(imageData: Data) async throws -> Plant {
        
        guard !imageData.isEmpty else {
            throw DomainError.invalidInput
        }
        
        return try await repository.identifyPlant(from: imageData)
    }
}
