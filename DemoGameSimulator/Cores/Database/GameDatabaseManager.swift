//
//  GameDatabaseManager.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation
 
class GameDatabaseManager: NSObject {
    static let shared = GameDatabaseManager()
    
    private override init() {
        super.init()
    }
    
    
}

// MARK: - Import
extension GameDatabaseManager {
    func importGame(url: URL) async {
        guard let gameType = GameType(rawValue: url.lastPathComponent) else {
            return
        }
        
        let id: String = UUID().uuidString
        let filename = id + "." + url.pathExtension
        
        let game = Game(id: id, filename: filename, gameType: gameType)
    }
}
