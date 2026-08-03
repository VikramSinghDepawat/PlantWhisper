//
//  OpenAIEndpoint.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

enum HTTPMethod: String, Sendable {
    case get = "GET"
    case post = "POST"
}

enum OpenAIEndpoint: Sendable {
    
    case responses
    
    var path: String {
        switch self {
        case .responses:
            return "/responses"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .responses:
            return .post
        }
    }
    
    func url(
        using configuration: OpenAIAPIConfiguration
    ) -> URL {
        configuration.baseURL.appendingPathComponent(path)
    }
}
