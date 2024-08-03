//
//  PlayersApp.swift
//  Players
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 02/08/24.
//

import SwiftData
import SwiftUI

@main
struct PlayersApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Player.self)
    }
}
