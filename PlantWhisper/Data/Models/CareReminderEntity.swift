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
    
    enum ReminderType: String, Codable {
        case watering
        case fertilizing
    }
    
    @Attribute(.unique)
    var id: UUID
    
    var plantID: UUID
    
    var type: ReminderType
    
    var title: String
    
    var message: String
    
    var scheduledDate: Date
    
    var isEnabled: Bool
    
    init(id: UUID = UUID(), plantID: UUID, type: ReminderType, title: String, message: String, scheduledDate: Date, isEnabled: Bool = true) {
        self.id = id
        self.plantID = plantID
        self.type = type
        self.title = title
        self.message = message
        self.scheduledDate = scheduledDate
        self.isEnabled = isEnabled
    }
}
