//
//  GrowthRecordEntity.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@Model
final class GrowthRecordEntity {
    
    // MARK: - Identity
    
    @Attribute(.unique)
    var id: UUID
    
    // MARK: - Relationship
    
    @Relationship
    var plant: PlantEntity
    
    // MARK: - Growth Data
    
    var recordedAt: Date
    
    /// Height in centimeters.
    var heightInCentimeters: Double?
    
    /// Optional observation.
    var note: String?
    
    /// Identifier of the stored photo.
    var photoIdentifier: String?
    
    // MARK: - Initialization
    
    init(
        id: UUID = UUID(),
        plant: PlantEntity,
        recordedAt: Date = .now,
        heightInCentimeters: Double? = nil,
        note: String? = nil,
        photoIdentifier: String? = nil
    ) {
        self.id = id
        self.plant = plant
        self.recordedAt = recordedAt
        self.heightInCentimeters = heightInCentimeters
        self.note = note
        self.photoIdentifier = photoIdentifier
    }
}
