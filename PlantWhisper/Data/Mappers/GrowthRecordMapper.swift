//
//  GrowthRecordMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum GrowthRecordMapper {
    
    // MARK: - Domain -> Entity
    
    static func toEntity(
        from record: GrowthRecord
    ) -> GrowthRecordEntity {
        
        GrowthRecordEntity(
            id: record.id,
            plantID: record.plantID,
            recordedAt: record.recordedAt,
            heightInCentimeters: record.heightInCentimeters,
            note: record.note,
            photoIdentifier: record.photoIdentifier
        )
    }
    
    // MARK: - Entity -> Domain
    
    static func toDomain(
        from entity: GrowthRecordEntity
    ) -> GrowthRecord {
        
        GrowthRecord(
            id: entity.id,
            plantID: entity.plantID,
            recordedAt: entity.recordedAt,
            heightInCentimeters: entity.heightInCentimeters,
            note: entity.note,
            photoIdentifier: entity.photoIdentifier
        )
    }
    
    // MARK: - Collection Mapping
    
    static func toDomain(
        from entities: [GrowthRecordEntity]
    ) -> [GrowthRecord] {
        entities.map(toDomain)
    }
    
    static func toEntity(
        from records: [GrowthRecord]
    ) -> [GrowthRecordEntity] {
        records.map(toEntity)
    }
}
