//
//  GenerateCareTipsUseCase.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol GenerateCareTipsUseCase: Sendable {
    
    /// Generates personalized care tips for a plant.
    func execute(for plant: Plant) async throws -> [String]
}

struct DefaultGenerateCareTipsUseCase: GenerateCareTipsUseCase, Sendable {
    
    private let repository: PlantAIRepository
    
    init(repository: PlantAIRepository) {
        self.repository = repository
    }
    
    func execute(for plant: Plant) async throws -> [String] {
        
        guard !plant.commonName.isEmpty else {
            throw DomainError.invalidInput
        }
        
        return try await repository.generateCareTips(for: plant)
    }
}
