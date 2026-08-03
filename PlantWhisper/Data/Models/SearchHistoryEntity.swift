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
    // MARK: - Identity
    @Attribute(.unique)
    var id: UUID
    
    /// Date of the search.
    var searchedAt: Date
    
    // MARK: - Result
    
    var identifiedCommonName: String
    
    var identifiedScientificName: String
    
    var confidence: Double
    
    /// Identifier for the original image.
    var imageIdentifier: String?
    
    var thumbnailIdentifier: String?
    
    var plant: PlantEntity
    
    init(
        id: UUID = UUID(),
        searchedAt: Date = .now,
        identifiedCommonName: String,
        identifiedScientificName: String,
        confidence: Double,
        imageIdentifier: String? = nil,
        thumbnailIdentifier: String? = nil
    ) {
        self.id = id
        self.searchedAt = searchedAt
        self.identifiedCommonName = identifiedCommonName
        self.identifiedScientificName = identifiedScientificName
        self.confidence = confidence
        self.imageIdentifier = imageIdentifier
        self.thumbnailIdentifier = thumbnailIdentifier
    }
}
