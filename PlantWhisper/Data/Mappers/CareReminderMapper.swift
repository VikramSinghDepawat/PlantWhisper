//
//  CareReminderMapper.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum CareReminderMapper {
    
    // MARK: - Domain -> Entity
    
    static func toEntity(from reminder: CareReminder) -> CareReminderEntity {
        
        CareReminderEntity(
            id: reminder.id,
            plantID: reminder.plantID,
            type: map(reminder.type),
            title: reminder.title,
            message: reminder.message,
            scheduledDate: reminder.scheduledDate,
            isEnabled: reminder.isEnabled
        )
    }
    
    // MARK: - Entity -> Domain
    
    static func toDomain(from entity: CareReminderEntity) -> CareReminder {
        
        CareReminder(
            id: entity.id,
            plantID: entity.plantID,
            type: map(entity.type),
            title: entity.title,
            message: entity.message,
            scheduledDate: entity.scheduledDate,
            isEnabled: entity.isEnabled
        )
    }
    
    // MARK: - Collections
    
    static func toDomain(from entities: [CareReminderEntity]) -> [CareReminder] {
        entities.map(toDomain)
    }
    
    static func toEntity(from reminders: [CareReminder]) -> [CareReminderEntity] {
        reminders.map(toEntity)
    }
    
    // MARK: - Private
    
    private static func map(_ type: CareReminder.ReminderType) -> CareReminderEntity.ReminderType {
        
        switch type {
        case .watering:
            return .watering
            
        case .fertilizing:
            return .fertilizing
        }
    }
    
    private static func map(_ type: CareReminderEntity.ReminderType) -> CareReminder.ReminderType {
        
        switch type {
        case .watering:
            return .watering
            
        case .fertilizing:
            return .fertilizing
        }
    }
}
