//
//  OpenAIResponseParser.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum OpenAIResponseParser {
    
    /// Decodes a JSON string into a strongly typed DTO.
    ///
    /// - Parameter json: Raw JSON returned by the AI service.
    /// - Returns: Decoded DTO.
    static func decode<T: Decodable & Sendable>(
        _ type: T.Type,
        from json: String
    ) throws -> T {
        
        let decoder = JSONDecoder()
        
        decoder.dateDecodingStrategy = .iso8601
        decoder.keyDecodingStrategy = .useDefaultKeys
        
        guard let data = json.data(using: .utf8) else {
            throw OpenAIResponseParserError.invalidUTF8
        }
        
        do {
            return try decoder.decode(
                T.self,
                from: data
            )
        } catch {
            
            throw OpenAIResponseParserError.decodingFailed(
                underlyingError: error
            )
        }
    }
}
