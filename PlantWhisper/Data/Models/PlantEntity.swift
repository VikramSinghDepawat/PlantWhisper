//
//  PlantEntity.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@Model
final class PlantEntity {
    
    // MARK: - Identity
    @Attribute(.unique)
    var id: UUID
    
    // MARK: - Plant Information
    var commonName: String
    var scientificName: String
    var confidence: Double
    var plantDescription: String
    var careInstructions: String
    
    var imageURL: URL?
    
    
    // MARK: - Relationships
    @Relationship(deleteRule: .cascade, inverse: \GrowthRecordEntity.plant)
    var growthRecords: [GrowthRecordEntity]

    @Relationship(deleteRule: .cascade, inverse: \CareReminderEntity.plant)
    var reminders: [CareReminderEntity]
    
    @Relationship(deleteRule: .cascade, inverse: \SearchHistoryEntity.plant)
    var searchHistory: [SearchHistoryEntity]
    
    @Relationship(deleteRule: .cascade, inverse: \PlantDiseaseEntity.plant)
    var diseaseAnalyses: [PlantDiseaseEntity]
    
    // MARK: - Initialization
    
    init(
        id: UUID = UUID(),
        commonName: String,
        scientificName: String,
        confidence: Double,
        plantDescription: String,
        careInstructions: String,
        imageURL: URL? = nil,
        growthRecords: [GrowthRecordEntity] = [],
        reminders: [CareReminderEntity] = [],
        searchHistory: [SearchHistoryEntity] = [],
        diseaseAnalyses: [PlantDiseaseEntity] = []
    ) {
        self.id = id
        self.commonName = commonName
        self.scientificName = scientificName
        self.confidence = confidence
        self.plantDescription = plantDescription
        self.careInstructions = careInstructions
        self.imageURL = imageURL
        
        self.growthRecords = growthRecords
        self.reminders = reminders
        self.searchHistory = searchHistory
        self.diseaseAnalyses = diseaseAnalyses
    }
}
