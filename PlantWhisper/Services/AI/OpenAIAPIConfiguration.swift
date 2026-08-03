//
//  OpenAIAPIConfiguration.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol OpenAIAPIConfiguration: Sendable {
    
    /// OpenAI API key.
    var apiKey: String { get }
    
    /// Base URL for the OpenAI API.
    var baseURL: URL { get }
    
    /// Model used for all AI requests.
    var model: String { get }
    
    /// Request timeout.
    var timeout: TimeInterval { get }
}

struct DefaultOpenAIAPIConfiguration: OpenAIAPIConfiguration {
    
    let apiKey: String
    let baseURL: URL
    let model: String
    let timeout: TimeInterval
    
    init(
        apiKey: String,
        baseURL: URL = URL(string: "https://api.openai.com/v1")!,
        model: String = "gpt-4.1-mini",
        timeout: TimeInterval = 60
    ) {
        self.apiKey = apiKey
        self.baseURL = baseURL
        self.model = model
        self.timeout = timeout
    }
}
