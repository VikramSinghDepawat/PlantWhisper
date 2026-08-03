//
//  AIDataSource.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol AIDataSource: Sendable {
    
    /// Identifies a plant from image data.
    func identifyPlant(
        from imageData: Data
    ) async throws -> PlantIdentificationDTO
    
    /// Detects a disease from image data.
    func detectDisease(
        from imageData: Data
    ) async throws -> DiseaseDetectionDTO
    
    /// Generates AI care tips.
    func generateCareTips(
        for plant: PlantIdentificationDTO
    ) async throws -> CareTipsDTO
}
