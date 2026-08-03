//
//  AppEnvironment.swift
//  PlantWhisper
//
//  Created by Vikram Singh Depawat on 03/08/26.
//

import Foundation
import Observation

@MainActor
@Observable
final class AppEnvironment {
    
    /// Indicates whether onboarding has been completed.
    var hasCompletedOnboarding: Bool = false
    
    /// The currently selected application language.
    var selectedLanguageCode: String = Locale.current.language.languageCode?.identifier ?? "en"
    
    init() { }
}
