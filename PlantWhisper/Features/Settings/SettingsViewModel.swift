//
//  SettingsViewModel.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class SettingsViewModel {
    
    // MARK: - Dependencies
    
    let container: AppContainer
    let environment: AppEnvironment
    
    // MARK: - State
    
    var title: String = "Settings"
    
    // MARK: - Initialization
    
    init(container: AppContainer, environment: AppEnvironment) {
        self.container = container
        self.environment = environment
    }
}
