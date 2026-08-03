//
//  PlantDiseaseEntity.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@Model
final class PlantDiseaseEntity {
    // MARK: - Severity
    enum Severity: String, Codable {
        case low
        case medium
        case high
    }
    
    // MARK: - Identity
    @Attribute(.unique)
    var id: UUID
    
    // MARK: - Relationship
    @Relationship
    var plant: PlantEntity
    
    // MARK: - Analysis
    var analyzedAt: Date
    
    var name: String
    
    var confidence: Double
    
    var severity: Severity
    
    // MARK: - Details
    
    var symptoms: [String]
    
    var causes: [String]
    
    var treatment: [String]
    
    var prevention: [String]
    
    // MARK: - Initialization
    
    init(
        id: UUID = UUID(),
        plant: PlantEntity,
        analyzedAt: Date = .now,
        name: String,
        confidence: Double,
        severity: Severity,
        symptoms: [String] = [],
        causes: [String] = [],
        treatment: [String] = [],
        prevention: [String] = []
    ) {
        self.id = id
        self.plant = plant
        self.analyzedAt = analyzedAt
        self.name = name
        self.confidence = confidence
        self.severity = severity
        self.symptoms = symptoms
        self.causes = causes
        self.treatment = treatment
        self.prevention = prevention
    }
}
