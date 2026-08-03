//
//  PlantWhisperApp.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 30/07/26.
//

import SwiftUI

@main
struct PlantWhisperApp: App {
    
    @State private var container = AppContainer()
    @State private var environment = AppEnvironment()
    
    var body: some Scene {
        WindowGroup {
            AppContainer(
                container: container
                environment: environment
            )
        }
    }
}
