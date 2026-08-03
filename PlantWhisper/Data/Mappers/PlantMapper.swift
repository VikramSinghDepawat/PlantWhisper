//
//  PlantMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation


protocol Mapper {
    associatedtype Domain
    associatedtype Entity
    
    static func toDomain(from entity: Entity) -> Domain
    static func toEntity(from domain: Domain) -> Entity
}

enum PlantMapper {
    
    // MARK: - Domain -> Entity
    
    static func toEntity(from plant: Plant) -> PlantEntity {
        
        PlantEntity(
            id: plant.id,
            commonName: plant.commonName,
            scientificName: plant.scientificName,
            confidence: plant.confidence,
            plantDescription: plant.description,
            careInstructions: plant.careInstructions,
            imageURL: plant.imageURL
        )
    }
    
    // MARK: - Entity -> Domain
    
    static func toDomain(from entity: PlantEntity) -> Plant {
        
        Plant(
            id: entity.id,
            commonName: entity.commonName,
            scientificName: entity.scientificName,
            confidence: entity.confidence,
            description: entity.plantDescription,
            careInstructions: entity.careInstructions,
            imageURL: entity.imageURL
        )
    }
    
    // MARK: - Collection Mapping
    
    static func toDomain(from entities: [PlantEntity]) -> [Plant] {
        entities.map(toDomain)
    }
    
    static func toEntity(from plants: [Plant]) -> [PlantEntity] {
        plants.map(toEntity)
    }
}
