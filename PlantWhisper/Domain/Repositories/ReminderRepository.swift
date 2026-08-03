//
//  ReminderRepository.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol ReminderRepository: Sendable {
    
    /// Returns all reminders.
    func fetchReminders() async throws -> [CareReminder]
    
    /// Returns a reminder by its identifier.
    func reminder(withID id: UUID) async throws -> CareReminder
    
    /// Saves a reminder.
    func save(reminder: CareReminder) async throws
    
    /// Updates an existing reminder.
    func update(reminder: CareReminder) async throws
    
    /// Deletes a reminder.
    func deleteReminder(withID id: UUID) async throws
}
