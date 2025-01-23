//
//  Game.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation

class Game {
    let id: String
    let filename: String
    let gameType: GameType
    
    init(id: String, filename: String, gameType: GameType) {
        self.id = id
        self.filename = filename
        self.gameType = gameType
    }
}
