//
//  PlantDisease.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct PlantDisease: Identifiable, Sendable, Codable, Equatable {
    
    enum Severity: String, CaseIterable, Codable, Sendable {
        case low
        case medium
        case high
    }
    
    let id: UUID
    let name: String
    let confidence: Double
    let severity: Severity
    let symptoms: [String]
    let causes: [String]
    let treatment: [String]
    let preservation: [String]
    
    init(id: UUID, name: String, confidence: Double, severity: Severity, symptoms: [String], causes: [String], treatment: [String], preservation: [String]) {
        self.id = id
        self.name = name
        self.confidence = confidence
        self.severity = severity
        self.symptoms = symptoms
        self.causes = causes
        self.treatment = treatment
        self.preservation = preservation
    }
}
