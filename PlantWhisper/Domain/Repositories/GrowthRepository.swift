//
//  GrowthRepository.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol GrowthRepository: Sendable {
    
    /// Returns every growth record for a specific plant.
    func growthRecords(forPlantID plantID: UUID) async throws -> [GrowthRecord]
    
    /// Returns a single growth record.
    func growthRecord(withID id: UUID) async throws -> GrowthRecord
    
    /// Saves a new growth record.
    func save(record: GrowthRecord) async throws
    
    /// Updates an existing growth record.
    func update(record: GrowthRecord) async throws
    
    /// Deletes a growth record.
    func deleteGrowthRecord(withID id: UUID) async throws
}
