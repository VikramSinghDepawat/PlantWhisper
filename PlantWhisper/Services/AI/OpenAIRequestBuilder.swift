//
//  OpenAIRequestBuilder.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct OpenAIRequestBuilder {
    
    struct Request: Sendable {
        
        let imageData: Data
        let systemPrompt: String
        let jsonSchema: String
        
        init(
            imageData: Data,
            systemPrompt: String,
            jsonSchema: String
        ) {
            self.imageData = imageData
            self.systemPrompt = systemPrompt
            self.jsonSchema = jsonSchema
        }
    }
    
    func build(
        imageData: Data,
        systemPrompt: String,
        jsonSchema: String
    ) -> Request {
        
        Request(
            imageData: imageData,
            systemPrompt: systemPrompt,
            jsonSchema: jsonSchema
        )
    }
}
