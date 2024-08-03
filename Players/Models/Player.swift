//
//  Player.swift
//  Players
//
//  Created by Eliezer Rodrigo Beltramin de Sant Ana on 02/08/24.
//

import Foundation
import SwiftData

@Model
class Player {
    var name: String
    var shirt: Int
    var isNew = true
    
    init(name: String, shirt: Int) {
        self.name = name
        self.shirt = shirt
    }
}
