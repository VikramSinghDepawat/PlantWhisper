//
//  DiseaseDetectionDTO.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct DiseaseDetectionDTO: Codable, Sendable {
    
    enum Severity: String, Codable, Sendable {
        case low
        case medium
        case high
    }
    
    let name: String
    let confidence: Double
    let severity: Severity
    let symptoms: [String]
    let causes: [String]
    let treatment: [String]
    let prevention: [String]
    
    init(
        name: String,
        confidence: Double,
        severity: Severity,
        symptoms: [String],
        causes: [String],
        treatment: [String],
        prevention: [String]
    ) {
        self.name = name
        self.confidence = confidence
        self.severity = severity
        self.symptoms = symptoms
        self.causes = causes
        self.treatment = treatment
        self.prevention = prevention
    }
}
