//
//  OpenAIRequest.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct OpenAIRequest: Codable, Sendable {
    
    let model: String
    let input: [InputMessage]
    let text: TextConfiguration?
    
    init(
        model: String,
        input: [InputMessage],
        text: TextConfiguration? = nil
    ) {
        self.model = model
        self.input = input
        self.text = text
    }
}

// MARK: - Input Message

extension OpenAIRequest {
    
    struct InputMessage: Codable, Sendable {
        
        let role: String
        let content: [Content]
        
        init(
            role: String,
            content: [Content]
        ) {
            self.role = role
            self.content = content
        }
    }
}

// MARK: - Content

extension OpenAIRequest {
    
    struct Content: Codable, Sendable {
        
        let type: String
        
        let text: String?
        let imageURL: String?
        
        enum CodingKeys: String, CodingKey {
            case type
            case text
            case imageURL = "image_url"
        }
        
        init(
            type: String,
            text: String? = nil,
            imageURL: String? = nil
        ) {
            self.type = type
            self.text = text
            self.imageURL = imageURL
        }
    }
}

// MARK: - Structured Output

extension OpenAIRequest {
    
    struct TextConfiguration: Codable, Sendable {
        
        let format: ResponseFormat
        
        init(
            format: ResponseFormat
        ) {
            self.format = format
        }
    }
    
    struct ResponseFormat: Codable, Sendable {
        
        let type: String
        let name: String
        let schema: JSONValue
        let strict: Bool
        
        enum CodingKeys: String, CodingKey {
            case type
            case name
            case schema
            case strict
        }
        
        init(
            type: String = "json_schema",
            name: String,
            schema: JSONValue,
            strict: Bool = true
        ) {
            self.type = type
            self.name = name
            self.schema = schema
            self.strict = strict
        }
    }
}
