//
//  PlantIdentificationDTO.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct PlantIdentificationDTO: Codable, Sendable {
    
    let commonName: String
    let scientificName: String
    let confidence: Double
    let description: String
    let careInstructions: String
    let imageURL: URL?
    
    init(
        commonName: String,
        scientificName: String,
        confidence: Double,
        description: String,
        careInstructions: String,
        imageURL: URL? = nil
    ) {
        self.commonName = commonName
        self.scientificName = scientificName
        self.confidence = confidence
        self.description = description
        self.careInstructions = careInstructions
        self.imageURL = imageURL
    }
}
