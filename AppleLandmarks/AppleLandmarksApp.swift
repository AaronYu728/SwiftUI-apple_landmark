//
//  AppleLandmarksApp.swift
//  AppleLandmarks
//
//  Created by BinYu on 28/2/2023.
//

import SwiftUI

@main
struct AppleLandmarksApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
