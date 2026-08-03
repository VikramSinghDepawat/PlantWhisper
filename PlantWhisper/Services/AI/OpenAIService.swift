//
//  OpenAIService.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol OpenAIService: Sendable {
    
    /// Executes an OpenAI Responses API request.
    ///
    /// - Parameter request: Fully constructed request payload.
    /// - Returns: Decoded OpenAI response.
    func execute(
        _ request: OpenAIRequest
    ) async throws -> OpenAIResponse
}
