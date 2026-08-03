//
//  DiseaseDetectionSchema.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct DiseaseDetectionSchema: OpenAIJSONSchema {
    
    let name = "disease_detection"
    
    let schema: JSONValue = .object([
        
        "type": .string("object"),
        
        "properties": .object([
            
            "name": .object([
                "type": .string("string")
            ]),
            
            "confidence": .object([
                "type": .string("number")
            ]),
            
            "severity": .object([
                "type": .string("string"),
                "enum": .array([
                    .string("low"),
                    .string("medium"),
                    .string("high")
                ])
            ]),
            
            "symptoms": .object([
                "type": .string("array"),
                "items": .object([
                    "type": .string("string")
                ])
            ]),
            
            "causes": .object([
                "type": .string("array"),
                "items": .object([
                    "type": .string("string")
                ])
            ]),
            
            "treatment": .object([
                "type": .string("array"),
                "items": .object([
                    "type": .string("string")
                ])
            ]),
            
            "prevention": .object([
                "type": .string("array"),
                "items": .object([
                    "type": .string("string")
                ])
            ])
        ]),
        
        "required": .array([
            .string("name"),
            .string("confidence"),
            .string("severity"),
            .string("symptoms"),
            .string("causes"),
            .string("treatment"),
            .string("prevention")
        ])
    ])
}
