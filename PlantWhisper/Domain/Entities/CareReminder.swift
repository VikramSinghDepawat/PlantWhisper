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
        case pruning
    }
    
    let id: UUID
    let plantID: UUID
    let type: ReminderType
    let title: String
    let message: String
    let scheduleDate: Date
    let isEnable: Bool
    
    init(id: UUID, plantID: UUID, type: ReminderType, title: String, message: String, scheduleDate: Date, isEnable: Bool) {
        self.id = id
        self.plantID = plantID
        self.type = type
        self.title = title
        self.message = message
        self.scheduleDate = scheduleDate
        self.isEnable = isEnable
    }
    
}
