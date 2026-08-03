//
//  HomeView.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import SwiftUI

struct HomeView: View {
    
    @State private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = State(initialValue: viewModel)
    }
    
    var body: some View {
        List {
            Section {
                NavigationLink(value: AppRoute.settings) {
                    Label("Settings", systemImage: "gear")
                }
            }
            
            Section("Coming Soon") {
                Label("AI Plant Identification", systemImage: "camera.viewfinder")
                Label("Disease Detection", systemImage: "cross.case")
                Label("Weekly Care Tips", systemImage: "leaf")
                Label("Weather-aware Watering", systemImage: "cloud.sun.rain")
                Label("Growth Tracking", systemImage: "chart.line.uptrend.xyaxis")
            }
        }
        .navigationTitle(viewModel.title)
    }
}

#Preview {
    NavigationStack {
        HomeView(
            viewModel: HomeViewModel(
                container: AppContainer(),
                environment: AppEnvironment()
            )
        )
    }
}
