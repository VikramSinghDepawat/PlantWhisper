//
//  CareTipsSchema.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct CareTipsSchema: OpenAIJSONSchema {
    
    let name = "care_tips"
    
    let schema: JSONValue = .object([
        
        "type": .string("object"),
        
        "properties": .object([
            
            "tips": .object([
                
                "type": .string("array"),
                
                "items": .object([
                    
                    "type": .string("object"),
                    
                    "properties": .object([
                        
                        "title": .object([
                            "type": .string("string")
                        ]),
                        
                        "description": .object([
                            "type": .string("string")
                        ]),
                        
                        "priority": .object([
                            "type": .string("string"),
                            "enum": .array([
                                .string("low"),
                                .string("medium"),
                                .string("high")
                            ])
                        ])
                    ]),
                    
                    "required": .array([
                        .string("title"),
                        .string("description"),
                        .string("priority")
                    ])
                ])
            ])
        ]),
        
        "required": .array([
            .string("tips")
        ])
    ])
}
