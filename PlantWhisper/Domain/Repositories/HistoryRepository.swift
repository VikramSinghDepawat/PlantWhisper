//
//  HistoryRepository.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol HistoryRepository: Sendable {
    
    /// Returns the complete search history ordered from newest to oldest.
    func fetchSearchHistory() async throws -> [SearchHistory]
    
    /// Returns a single history item.
    func historyItem(withID id: UUID) async throws -> SearchHistory
    
    /// Saves a search history entry.
    func save(historyItem: SearchHistory) async throws
    
    /// Deletes a history entry.
    func deleteHistoryItem(withID id: UUID) async throws
    
    /// Removes all stored search history.
    func deleteAllHistory() async throws
}
