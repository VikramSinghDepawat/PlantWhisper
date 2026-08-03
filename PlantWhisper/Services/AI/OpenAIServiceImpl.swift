//
//  OpenAIServiceImpl.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

final class OpenAIServiceImpl: OpenAIService {
    
    private let configuration: OpenAIAPIConfiguration
    private let session: URLSession
    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    
    init(
        configuration: OpenAIAPIConfiguration,
        session: URLSession = .shared,
        encoder: JSONEncoder = JSONEncoder(),
        decoder: JSONDecoder = JSONDecoder()
    ) {
        self.configuration = configuration
        self.session = session
        self.encoder = encoder
        self.decoder = decoder
    }
    
    func execute(
        _ request: OpenAIRequest
    ) async throws -> OpenAIResponse {
        
        var urlRequest = URLRequest(
            url: OpenAIEndpoint.responses.url(
                using: configuration
            )
        )
        
        urlRequest.httpMethod = OpenAIEndpoint.responses.method.rawValue
        urlRequest.timeoutInterval = configuration.timeout
        
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        urlRequest.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )
        
        urlRequest.setValue(
            "Bearer \(configuration.apiKey)",
            forHTTPHeaderField: "Authorization"
        )
       
        urlRequest.httpBody = try encoder.encode(request)
        
        let (data, response) = try await session.data(
            for: urlRequest
        )
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw OpenAIServiceError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw OpenAIServiceError.httpError(
                statusCode: httpResponse.statusCode,
                body: String(data: data, encoding: .utf8)
            )
        }
        
        do {
            return try decoder.decode(
                OpenAIResponse.self,
                from: data
            )
        } catch {
            throw OpenAIServiceError.decodingFailed(underlying: error)
        }
    }
}


enum OpenAIServiceError: LocalizedError {
    
    case invalidResponse
    
    case httpError(
        statusCode: Int,
        body: String?
    )
    
    case decodingFailed(
        underlying: Error
    )
    
    var errorDescription: String? {
        
        switch self {
            
        case .invalidResponse:
            return "The server returned an invalid HTTP response."
            
        case .httpError(let statusCode, let body):
            
            return """
            OpenAI request failed.
            
            HTTP Status: \(statusCode)
            
            \(body ?? "No response body.")
            """
            
        case .decodingFailed(let error):
            
            return """
            Failed to decode the OpenAI response.
            
            \(error.localizedDescription)
            """
        }
    }
}
