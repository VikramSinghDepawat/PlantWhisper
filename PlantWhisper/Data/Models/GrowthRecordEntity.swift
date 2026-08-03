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
    
    @Attribute(.unique)
    var id: UUID
    
    /// References the owning plant.
    var plantID: UUID
    
    /// Date the growth record was created.
    var recordedAt: Date
    
    /// Height in centimeters.
    var heightInCentimeters: Double?
    
    /// Optional user note.
    var note: String?
    
    /// Identifier used to retrieve the stored image.
    var photoIdentifier: String?
    
    @Relationship(inverse: \PlantEntity.reminders)
    var plant: PlantEntity
    
    init(
        id: UUID = UUID(),
        plantID: UUID,
        recordedAt: Date = .now,
        heightInCentimeters: Double? = nil,
        note: String? = nil,
        photoIdentifier: String? = nil
    ) {
        self.id = id
        self.plantID = plantID
        self.recordedAt = recordedAt
        self.heightInCentimeters = heightInCentimeters
        self.note = note
        self.photoIdentifier = photoIdentifier
    }
}
