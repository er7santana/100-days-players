//
//  EditPlayerView.swift
//  Players
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 02/08/24.
//

import SwiftData
import SwiftUI

struct EditPlayerView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var player: Player
    
    var body: some View {
        Form {
            TextField("Name", text: $player.name)
            Picker("Favorite shirt", selection: $player.shirt) {
                ForEach(0..<101) { number in
                    Text(String(number))
                }
            }
            .navigationTitle(player.isNew ? "New Player" : "Edit Player")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(player.isNew)
            .toolbar {
                if player.isNew {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") { cancel() }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { save() }
                        .disabled(player.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
        }
    }
    
    func cancel() {
        modelContext.delete(player)
        dismiss()
    }
    
    func save() {
        player.isNew = false
        dismiss()
    }
}

#Preview {
    
    do {
        let config = try ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Player.self, configurations: config)
        return NavigationView {
            EditPlayerView(player: Player(name: "Ronaldo", shirt: 9))
        }
        .modelContainer(container)
    } catch {
        return Text("Failed to initialize container: \(error.localizedDescription)")
    }
    
    
}
