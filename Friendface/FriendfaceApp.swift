//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Aaron Graves on 8/6/24.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
