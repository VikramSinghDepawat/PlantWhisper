//
//  SaveSearchHistoryUseCase.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol SaveSearchHistoryUseCase: Sendable {
    
    /// Saves a search history entry.
    ///
    /// - Parameter historyItem: The history item to persist.
    func execute(historyItem: SearchHistory) async throws
}

struct DefaultSaveSearchHistoryUseCase: SaveSearchHistoryUseCase, Sendable {
    
    private let repository: HistoryRepository
    
    init(repository: HistoryRepository) {
        self.repository = repository
    }
    
    func execute(historyItem: SearchHistory) async throws {
        
        guard !historyItem.plant.commonName.isEmpty else {
            throw DomainError.invalidInput
        }
        
        try await repository.save(historyItem: historyItem)
    }
}
