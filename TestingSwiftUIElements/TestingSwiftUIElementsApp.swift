//
//  TestingSwiftUIElementsApp.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 14/01/25.
//

import SwiftUI
import SwiftData

@main
struct TestingSwiftUIElementsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Game.self, Platform.self])
        }
    }
}
