//
//  PlantDiseaseMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum PlantDiseaseMapper {
    
    // MARK: - Domain -> Entity
    
    static func toEntity(from disease: PlantDisease) -> PlantDiseaseEntity {
        
        PlantDiseaseEntity(
            id: disease.id,
            name: disease.name,
            confidence: disease.confidence,
            severity: .init(rawValue: disease.severity.rawValue) ?? .low,
            symptoms: disease.symptoms,
            causes: disease.causes,
            treatment: disease.treatment,
            prevention: disease.prevention
        )
    }
    
    // MARK: - Entity -> Domain
    
    static func toDomain(from entity: PlantDiseaseEntity) -> PlantDisease {
        
        PlantDisease(
            id: entity.id,
            name: entity.name,
            confidence: entity.confidence,
            severity: .init(rawValue: entity.severity.rawValue) ?? .low,
            symptoms: entity.symptoms,
            causes: entity.causes,
            treatment: entity.treatment,
            prevention: entity.prevention
        )
    }
    
    // MARK: - Collection Mapping
    
    static func toDomain(from entities: [PlantDiseaseEntity]) -> [PlantDisease] {
        entities.map(toDomain)
    }
    
    static func toEntity(from diseases: [PlantDisease]) -> [PlantDiseaseEntity] {
        diseases.map(toEntity)
    }
}
