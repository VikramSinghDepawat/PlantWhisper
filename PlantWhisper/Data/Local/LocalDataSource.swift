//
//  LocalDataSource.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import SwiftData

protocol LocalDataSource: Sendable {
    
    func fetch<T: PersistentModel>(
        _ descriptor: FetchDescriptor<T>
    ) throws -> [T]
    
    func fetchOne<T: PersistentModel>(
        _ descriptor: FetchDescriptor<T>
    ) throws -> T?
    
    func insert<T: PersistentModel>(
        _ model: T
    )
    
    func delete<T: PersistentModel>(
        _ model: T
    )
    
    func save() throws
}

@MainActor
final class SwiftDataLocalDataSource: LocalDataSource {
    
    private let context: ModelContext
    
    init(
        context: ModelContext
    ) {
        self.context = context
    }
    
    func fetch<T: PersistentModel>(
        _ descriptor: FetchDescriptor<T>
    ) throws -> [T] {
        try context.fetch(descriptor)
    }
    
    func fetchOne<T: PersistentModel>(
        _ descriptor: FetchDescriptor<T>
    ) throws -> T? {
        try context.fetch(descriptor).first
    }
    
    func insert<T: PersistentModel>(
        _ model: T
    ) {
        context.insert(model)
    }
    
    func delete<T: PersistentModel>(
        _ model: T
    ) {
        context.delete(model)
    }
    
    func save() throws {
        guard context.hasChanges else {
            return
        }
        
        try context.save()
    }
}
