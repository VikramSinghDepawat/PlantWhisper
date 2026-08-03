//
//  LocalDataSource.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

protocol LocalDataSource: Sendable {
    
    // MARK: - Fetch
    
    func fetch<T: PersistentModel>(
        descriptor: FetchDescriptor<T>
    ) throws -> [T]
    
    func fetchOne<T: PersistentModel>(
        descriptor: FetchDescriptor<T>
    ) throws -> T?
    
    // MARK: - Insert
    
    func insert<T: PersistentModel>(
        _ model: T
    ) throws
    
    // MARK: - Delete
    
    func delete<T: PersistentModel>(
        _ model: T
    ) throws
    
    // MARK: - Save
    
    func save() throws
}

@MainActor
final class SwiftDataLocalDataSource: LocalDataSource {
    
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetch<T: PersistentModel>(
        descriptor: FetchDescriptor<T>
    ) throws -> [T] {
        try modelContext.fetch(descriptor)
    }
    
    func fetchOne<T: PersistentModel>(
        descriptor: FetchDescriptor<T>
    ) throws -> T? {
        try modelContext.fetch(descriptor).first
    }
    
    func insert<T: PersistentModel>(
        _ model: T
    ) throws {
        modelContext.insert(model)
    }
    
    func delete<T: PersistentModel>(
        _ model: T
    ) throws {
        modelContext.delete(model)
    }
    
    func save() throws {
        if modelContext.hasChanges {
            try modelContext.save()
        }
    }
}
