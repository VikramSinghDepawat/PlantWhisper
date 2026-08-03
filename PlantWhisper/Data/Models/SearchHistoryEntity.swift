//
//  SearchHistoryEntity.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@Model
final class SearchHistoryEntity {
    
    @Attribute(.unique)
    var id: UUID
    
    /// Date of the search.
    var searchedAt: Date
    
    /// Identifier for the original image.
    var imageIdentifier: String?
    
    var plant: PlantEntity
    
    init(
        id: UUID = UUID(),
        searchedAt: Date = .now,
        imageIdentifier: String? = nil
    ) {
        self.id = id
        self.searchedAt = searchedAt
        self.imageIdentifier = imageIdentifier
    }
}
