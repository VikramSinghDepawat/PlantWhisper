//
//  OpenAIRequestBuilder.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct OpenAIRequestBuilder {
    
    func build(
        imageData: Data,
        systemPrompt: String,
        configuration: OpenAIAPIConfiguration,
        schema: some OpenAIJSONSchema
    ) -> OpenAIRequest {
        
        let dataURL = makeDataURL(from: imageData)
        
        return OpenAIRequest(
            model: configuration.model,
            input: [
                .init(
                    role: "user",
                    content: [
                        .inputText(systemPrompt),
                        .inputImage(
                            imageURL: dataURL,
                            detail: .high
                        )
                    ]
                )
            ],
            text: .init(
                format: .init(
                    name: schemaName,
                    schema: schema,
                    strict: true
                )
            )
        )
    }
}

// MARK: - Private

private extension OpenAIRequestBuilder {
    
    func makeDataURL(
        from imageData: Data
    ) -> String {
        
        let base64 = imageData.base64EncodedString()
        
        return "data:image/jpeg;base64,\(base64)"
    }
}
