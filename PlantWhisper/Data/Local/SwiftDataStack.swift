//
//  SwiftDataStack.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

@MainActor
final class SwiftDataStack {
    
    let container: ModelContainer
    let mainContext: ModelContext
    
    init(
        inMemory: Bool = false
    ) throws {
        
        let schema = Schema([
            PlantEntity.self,
            PlantDiseaseEntity.self,
            GrowthRecordEntity.self,
            CareReminderEntity.self,
            SearchHistoryEntity.self
        ])
        
        let configuration = ModelConfiguration(
            isStoredInMemoryOnly: inMemory
        )
        
        container = try ModelContainer(
            for: schema,
            configurations: [configuration]
        )
        
        mainContext = ModelContext(container)
    }
}
