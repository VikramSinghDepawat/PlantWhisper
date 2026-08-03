//
//  SearchHistoryMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum SearchHistoryMapper {
    
    // MARK: - Domain -> Entity
    
    static func toEntity(
        from history: SearchHistory
    ) -> SearchHistoryEntity {
        
        SearchHistoryEntity(
            id: history.id,
            plant: PlantMapper.toEntity(from: history.plant),
            searchedAt: history.searchedAt,
            imageIdentifier: history.imageIdentifier
        )
    }
    
    // MARK: - Entity -> Domain
    
    static func toDomain(
        from entity: SearchHistoryEntity
    ) -> SearchHistory {
        
        SearchHistory(
            id: entity.id,
            plant: PlantMapper.toDomain(from: entity.plant),
            searchedAt: entity.searchedAt,
            imageIdentifier: entity.imageIdentifier
        )
    }
    
    // MARK: - Collections
    
    static func toDomain(
        from entities: [SearchHistoryEntity]
    ) -> [SearchHistory] {
        entities.map(toDomain)
    }
    
    static func toEntity(
        from history: [SearchHistory]
    ) -> [SearchHistoryEntity] {
        history.map(toEntity)
    }
}
