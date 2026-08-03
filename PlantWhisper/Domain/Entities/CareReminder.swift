//
//  CareReminder.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct CareReminder: Identifiable, Equatable, Sendable {
    
    enum ReminderType: String, CaseIterable, Codable, Sendable {
        case watering
        case fertilizing
    }
    
    let id: UUID
    let plantID: UUID
    let type: ReminderType
    let title: String
    let message: String
    let scheduledDate: Date
    let isEnabled: Bool
    
    init(id: UUID, plantID: UUID, type: ReminderType, title: String, message: String, scheduledDate: Date, isEnabled: Bool) {
        self.id = id
        self.plantID = plantID
        self.type = type
        self.title = title
        self.message = message
        self.scheduledDate = scheduledDate
        self.isEnabled = isEnabled
    }
    
}
