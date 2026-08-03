//
//  DomainError.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum DomainError: LocalizedError, Equatable {
    
    case invalidInput
    case plantNotFound
    case networkUnavailable
    case unauthorized
    case decodingFailed
    case persistenceFailure
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "The provided input is invalid."
            
        case .plantNotFound:
            return "No plant could be identified."
            
        case .networkUnavailable:
            return "Network connection is unavailable."
            
        case .unauthorized:
            return "Authorization failed."
            
        case .decodingFailed:
            return "Unable to process the received data."
            
        case .persistenceFailure:
            return "Failed to save or load local data."
            
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
