//
//  PlantRepository.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol PlantRepository: Sendable {    
    /// Identifies a plant from an image.
    ///
    /// - Parameter imageData: Image Data captured by the user.
    /// - Returns: A successfully identified plant.
    ///
    func identifyPlant(from imageData: Data) async throws -> Plant
    
    /// Detects plant disease from an image
    func detectDisease(from imageData: Data) async throws -> PlantDisease
        
    /// Retrieves a previously identified plant.
    ///
    /// - Parameter id: Unique plant identifier.
    ///
    func plant(withID id: UUID) async throws -> Plant
    
    /// Retrieves all identified plants.
    func fetchPlants() async throws -> [Plant]
}
