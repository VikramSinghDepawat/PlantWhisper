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
        let type: String
        let role: String
        let content: [Content]
        
        init(
            role: String,
            content: [Content]
        ) {
            self.type = "message"
            self.role = role
            self.content = content
        }
    }
}

// MARK: - Content

extension OpenAIRequest {
    
    enum Content: Codable, Sendable {
        
        case inputText(String)
        case inputImage(imageURL: String, detail: ImageDetail = .auto)
        
        enum ImageDetail: String, Codable, Sendable {
            case low
            case high
            case auto
        }
        
        enum CodingKeys: String, CodingKey {
            case type
            case text
            case imageURL = "image_url"
            case detail
        }
        
        enum ContentType: String, Codable {
            case inputText = "input_text"
            case inputImage = "input_image"
        }
        
        init(from decoder: any Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            let type = try container.decode(ContentType.self, forKey: .type)
            
            switch type {
            case .inputText:
                
                let text = try container.decode(
                    String.self,
                    forKey: .text
                )
                
                self = .inputText(text)
                
            case .inputImage:
                
                let url = try container.decode(
                    String.self,
                    forKey: .imageURL
                )
                
                let detail = try container.decodeIfPresent(
                    ImageDetail.self,
                    forKey: .detail
                ) ?? .auto
                
                self = .inputImage(
                    imageURL: url,
                    detail: detail
                )
            }
        }
        
        func encode(to encoder: any Encoder) throws {
            var container = encoder.container(
                keyedBy: CodingKeys.self
            )
            
            switch self {
                
            case .inputText(let text):
                
                try container.encode(
                    ContentType.inputText,
                    forKey: .type
                )
                
                try container.encode(
                    text,
                    forKey: .text
                )
                
            case .inputImage(let imageURL, let detail):
                
                try container.encode(
                    ContentType.inputImage,
                    forKey: .type
                )
                
                try container.encode(
                    imageURL,
                    forKey: .imageURL
                )
                
                try container.encode(
                    detail,
                    forKey: .detail
                )
            }
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
