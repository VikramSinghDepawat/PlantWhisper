//
//  CareReminderEntity.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@Model
final class CareReminderEntity {
    
    // MARK: - Reminder Type

    enum ReminderType: String, Codable {
        case watering
        case fertilizing
    }
    
    // MARK: - Identity
    @Attribute(.unique)
    var id: UUID
    
    // MARK: - Relationship
    @Relationship
    var plant: PlantEntity
    
    // MARK: - Reminder
    var type: ReminderType
    
    var title: String
    
    var message: String
    
    var scheduledDate: Date
    
    var isEnabled: Bool
    
    init(
        id: UUID = UUID(),
        plant: PlantEntity,
        type: ReminderType,
        title: String,
        message: String,
        scheduledDate: Date,
        isEnabled: Bool = true
    ) {
        self.id = id
        self.plant = plant
        self.type = type
        self.title = title
        self.message = message
        self.scheduledDate = scheduledDate
        self.isEnabled = isEnabled
    }
}
