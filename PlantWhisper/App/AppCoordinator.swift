//
//  AppCoordinator.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation

struct AppCoordinator: View {
    
    let container: AppContainer
    let environment: AppEnvironment
    
    @State private var path: [AppRoute] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            HomeView(
                viewModel:HomeViewModel(container: container, environment: environment)
            )
            .navigationDestination(for: AppRoute.self) { route in
                destination(for: route)
            }
        }
    }
}

@ViewBuilder
private func destination(for route: AppRoute) -> some View {
    switch route {
    case .settings:
        SettingsView(
            viewModel: SettingsViewModel(container: container, environment: environment)
        )
    }
}
