//
//  PlantIdentificationDTOMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum PlantIdentificationDTOMapper {
    
    // MARK: - DTO -> Domain
    
    static func toDomain(
        from dto: PlantIdentificationDTO
    ) -> Plant {
        
        Plant(
            id: UUID(),
            commonName: dto.commonName,
            scientificName: dto.scientificName,
            confidence: dto.confidence,
            description: dto.description,
            careInstructions: dto.careInstructions,
            imageURL: dto.imageURL
        )
    }
    
    // MARK: - Domain -> DTO
    
    static func toDTO(
        from plant: Plant
    ) -> PlantIdentificationDTO {
        
        PlantIdentificationDTO(
            commonName: plant.commonName,
            scientificName: plant.scientificName,
            confidence: plant.confidence,
            description: plant.description,
            careInstructions: plant.careInstructions,
            imageURL: plant.imageURL
        )
    }
    
    // MARK: - Collection Mapping
    
    static func toDomain(
        from dtos: [PlantIdentificationDTO]
    ) -> [Plant] {
        dtos.map(toDomain)
    }
    
    static func toDTO(
        from plants: [Plant]
    ) -> [PlantIdentificationDTO] {
        plants.map(toDTO)
    }
}
