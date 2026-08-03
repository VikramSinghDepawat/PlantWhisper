//
//  PlantPrompts.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum PlantPrompts {
    
    static let identification = """
    You are an expert botanist.
    
    Identify the plant from the supplied image.
    
    Return ONLY valid JSON matching the provided JSON Schema.
    
    Do not include markdown.
    Do not include explanations.
    """
    
    static let diseaseDetection = """
    You are a plant pathologist.
    
    Analyze the supplied image for diseases.
    
    Return ONLY valid JSON matching the provided JSON Schema.
    
    If no disease is visible, return a healthy result with empty arrays.
    
    Do not include markdown.
    """
    
    static func careTips(
        for plant: PlantIdentificationDTO
    ) -> String {
        
        """
        You are a professional horticulturist.
        
        Generate weekly care recommendations for:
        
        Common Name:
        \(plant.commonName)
        
        Scientific Name:
        \(plant.scientificName)
        
        Return ONLY valid JSON matching the supplied JSON Schema.
        """
    }
}
