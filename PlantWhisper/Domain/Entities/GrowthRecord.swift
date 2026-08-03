//
//  GrowthRecord.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct GrowthRecord: Identifiable, Equatable, Sendable, Codable {
    
    let id: UUID
    let plantID: UUID
    let recordedAt: Date
    
    // Height in centimeters.
    let heightInCentimeters: Double?
    
    // Optional note entered by user.
    let note: String?
    
    // Relative path or identifier for the stored photo.
    let photoIdentifier: String?
    
    init(id: UUID, plantID: UUID, recordedAt: Date, heightInCentimeters: Double?, note: String?, photoIdentifier: String?) {
        self.id = id
        self.plantID = plantID
        self.recordedAt = recordedAt
        self.heightInCentimeters = heightInCentimeters
        self.note = note
        self.photoIdentifier = photoIdentifier
    }
}
