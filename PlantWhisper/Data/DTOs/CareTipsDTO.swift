//
//  CareTipsDTO.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct CareTipsDTO: Codable, Sendable {
    
    let tips: [Tip]
    
    init(tips: [Tip]) {
        self.tips = tips
    }
}

// MARK: - Tip

extension CareTipsDTO {
    
    struct Tip: Codable, Sendable, Identifiable {
        
        enum Priority: String, Codable, Sendable {
            case low
            case medium
            case high
        }
        
        let id: UUID
        let title: String
        let description: String
        let priority: Priority
        
        init(
            id: UUID = UUID(),
            title: String,
            description: String,
            priority: Priority
        ) {
            self.id = id
            self.title = title
            self.description = description
            self.priority = priority
        }
    }
}
