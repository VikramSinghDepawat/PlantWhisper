//
//  OpenAIJSONSchema.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

protocol OpenAIJSONSchema: Sendable {
    
    /// Name of the schema sent to the Responses API.
    var name: String { get }
    
    /// JSON Schema definition.
    var schema: JSONValue { get }
}
