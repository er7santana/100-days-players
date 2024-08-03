//
//  ContentView.swift
//  Players
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 02/08/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Player.name) var players: [Player]
    @State private var path = [Player]()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(players) { player in
                    NavigationLink(value: player) {
                        HStack {
                            Text(player.name)
                            
                            Spacer()
                            
                            Text(player.shirt.formatted())
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationTitle("Players")
            .navigationDestination(for: Player.self) { player in
                EditPlayerView(player: player)
            }
            .toolbar {
                
                EditButton()
                
                Button("Add Player", systemImage: "plus") {
                    let player = Player(name: "", shirt: 5)
                    modelContext.insert(player)
                    path = [player]
                }
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let player = players[offset]
            modelContext.delete(player)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Player.self)
}
