//
//  Game.swift
//  TestingSwiftUIElements
//
//  Created by iredefbmac_33 on 19/01/25.
//

import Foundation
import SwiftData

@Model
class Game: Hashable {
    var name: String
    var rating: Int
    
    init(name: String, rating: Int) {
        self.name = name
        self.rating = rating
    }
}
