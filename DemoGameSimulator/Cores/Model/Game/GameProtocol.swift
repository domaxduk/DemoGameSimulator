//
//  GameProtocol.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation

protocol GameProtocol {
    var fileURL: URL { get }
    var gameSaveURL: URL { get }
    
    var type: GameType { get }
}

extension GameProtocol {
    var gameSaveURL: URL {
      //  let fileExtension = Delta.core(for: self.type)?.gameSaveFileExtension ??
        let gameURL = self.fileURL.deletingPathExtension()
        let gameSaveURL = gameURL.appendingPathExtension("sav")
        return gameSaveURL
    }
}
