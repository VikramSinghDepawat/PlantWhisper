//
//  GetGrowthHistoryUseCase.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol GetGrowthHistoryUseCase: Sendable {
    
    /// Returns all growth records for a plant ordered chronologically.
    func execute(plantID: UUID) async throws -> [GrowthRecord]
}

struct DefaultGetGrowthHistoryUseCase: GetGrowthHistoryUseCase, Sendable {
    
    private let repository: GrowthRepository
    
    init(repository: GrowthRepository) {
        self.repository = repository
    }
    
    func execute(plantID: UUID) async throws -> [GrowthRecord] {
        
        let records = try await repository.growthRecords(
            forPlantID: plantID
        )
        
        return records.sorted {
            $0.recordedAt < $1.recordedAt
        }
    }
}
