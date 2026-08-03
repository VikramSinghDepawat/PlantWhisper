//
//  SettingsView.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var viewModel: SettingsViewModel
    
    init(viewModel: SettingsViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        List {
            Section("General") {
                HStack {
                    Label("Language", systemImage: "globe")
                    Spacer()
                    Text(viewModel.environment.selectedLanguageCode.uppercased())
                        .foregroundStyle(.secondary)
                }
            }
            
            Section("Application") {
                HStack {
                    Label("Version", systemImage: "info.circle")
                    Spacer()
                    Text(appVersion)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle(viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var appVersion: String {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
        let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "1"
        
        return "\(version) (\(build))"
    }
}

#Preview {
    NavigationStack {
        SettingsView(
            viewModel: SettingsViewModel(
                container: AppContainer(),
                environment: AppEnvironment()
            )
        )
    }
}
