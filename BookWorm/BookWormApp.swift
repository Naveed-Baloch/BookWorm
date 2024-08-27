//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Naveed on 26/08/2024.
//

import SwiftUI
import SwiftData

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Student.self)
    }
}
