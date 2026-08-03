//
//  OpenAIResponseParserError.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum OpenAIResponseParserError: Error, LocalizedError {
    
    case invalidUTF8
    
    case decodingFailed(
        underlyingError: Error
    )
    
    var errorDescription: String? {
        
        switch self {
            
        case .invalidUTF8:
            return "The AI response was not valid UTF-8."
            
        case .decodingFailed(let error):
            return "Failed to decode AI response: \(error.localizedDescription)"
        }
    }
}
