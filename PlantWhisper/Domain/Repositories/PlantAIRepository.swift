//
//  PlantAIRepository.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol PlantAIRepository: Sendable {
    
    /// Identifies a plant from image data.
    func identifyPlant(from imageData: Data) async throws -> Plant
    
    /// Detects plant disease from image data.
    func detectDisease(from imageData: Data) async throws -> PlantDisease
    
    /// Generates personalized care tips.
    func generateCareTips(for plant: Plant) async throws -> [String]
}
