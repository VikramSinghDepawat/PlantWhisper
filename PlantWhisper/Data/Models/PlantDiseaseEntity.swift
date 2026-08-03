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
    
    enum Severity: String, Codable {
        case low
        case medium
        case high
    }
    
    @Attribute(.unique)
    var id: UUID
    var name: String
    var confidence: Double
    var severity: Severity
    var symptoms: [String]
    var causes: [String]
    var treatment: [String]
    var prevention: [String]
    
    init(id: UUID, name: String, confidence: Double, severity: Severity, symptoms: [String], causes: [String], treatment: [String], prevention: [String]) {
        self.id = id
        self.name = name
        self.confidence = confidence
        self.severity = severity
        self.symptoms = symptoms
        self.causes = causes
        self.treatment = treatment
        self.prevention = prevention
    }
}
