//
//  OpenAIResponse.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct OpenAIResponse: Decodable, Sendable {
    
    let id: String
    let output: [OutputItem]
    
    /// Returns the first text output produced by the model.
    var outputText: String? {
        
        output
            .flatMap(\.content)
            .compactMap(\.text)
            .first
    }
}

// MARK: - Output Item

extension OpenAIResponse {
    
    struct OutputItem: Decodable, Sendable {
        
        let type: String
        let content: [Content]
    }
}

// MARK: - Content

extension OpenAIResponse {
    
    struct Content: Decodable, Sendable {
        
        let type: String
        let text: String?
        
        enum CodingKeys: String, CodingKey {
            case type
            case text
        }
    }
}
