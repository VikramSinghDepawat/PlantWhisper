//
//  PlantIdentificationSchema.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct PlantIdentificationSchema: OpenAIJSONSchema {
    
    let name = "plant_identification"
    
    let schema: JSONValue = .object([
        
        "type": .string("object"),
        
        "properties": .object([
            
            "commonName": .object([
                "type": .string("string")
            ]),
            
            "scientificName": .object([
                "type": .string("string")
            ]),
            
            "confidence": .object([
                "type": .string("number")
            ]),
            
            "description": .object([
                "type": .string("string")
            ]),
            
            "careInstructions": .object([
                "type": .string("string")
            ])
        ]),
        
        "required": .array([
            .string("commonName"),
            .string("scientificName"),
            .string("confidence"),
            .string("description"),
            .string("careInstructions")
        ])
    ])
}
