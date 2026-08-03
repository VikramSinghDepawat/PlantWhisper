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
    
    // MARK: - Properties
    
    let container: ModelContainer
    
    var mainContext: ModelContext {
        container.mainContext
    }
    
    // MARK: - Initialization
    
    init(isStoredInMemoryOnly: Bool = false) throws {
        
        let schema = Schema([
            PlantEntity.self,
            PlantDiseaseEntity.self,
            CareReminderEntity.self,
            GrowthRecordEntity.self,
            SearchHistoryEntity.self
        ])
        
        let configuration = ModelConfiguration(
            isStoredInMemoryOnly: isStoredInMemoryOnly
        )
        
        container = try ModelContainer(
            for: schema,
            configurations: [configuration]
        )
    }
}
