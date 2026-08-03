//
//  PlantRepositoryImpl.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

final class PlantRepositoryImpl: PlantRepository {
    
    private let aiDataSource: AIDataSource
    private let localDataSource: LocalDataSource
    
    init(
        aiDataSource: AIDataSource,
        localDataSource: LocalDataSource
    ) {
        self.aiDataSource = aiDataSource
        self.localDataSource = localDataSource
    }
    
    // MARK: - AI
    
    func identifyPlant(
        from imageData: Data
    ) async throws -> Plant {
        
        let dto = try await aiDataSource.identifyPlant(
            from: imageData
        )
        
        let plant = PlantIdentificationDTOMapper.toDomain(
            from: dto
        )
        
        let entity = PlantMapper.toEntity(
            from: plant
        )
        
        try localDataSource.insert(entity)
        try localDataSource.save()
        
        return plant
    }
    
    // MARK: - Persistence
    
    func save(
        _ plant: Plant
    ) async throws {
        
        let entity = PlantMapper.toEntity(
            from: plant
        )
        
        try localDataSource.insert(entity)
        try localDataSource.save()
    }
    
    func fetchAll() async throws -> [Plant] {
        
        let descriptor = FetchDescriptor<PlantEntity>(
            sortBy: [
                SortDescriptor(\.commonName)
            ]
        )
        
        let entities = try localDataSource.fetch(
            descriptor: descriptor
        )
        
        return PlantMapper.toDomain(
            from: entities
        )
    }
}
