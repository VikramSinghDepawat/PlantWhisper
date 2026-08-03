//
//  SearchHistory.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct SearchHistory: Identifiable, Sendable, Codable, Equatable {
    
    let id: UUID
    
    // The identified plant.
    let plant: Plant
    
    // Date when the identification was performed.
    let searchedAt: Date
    
    // Original image identifer stored by the application.
    let imageIdentifier: String?
    
    init(id: UUID, plant: Plant, searchedAt: Date, imageIdentifier: String?) {
        self.id = id
        self.plant = plant
        self.searchedAt = searchedAt
        self.imageIdentifier = imageIdentifier
    }
}
