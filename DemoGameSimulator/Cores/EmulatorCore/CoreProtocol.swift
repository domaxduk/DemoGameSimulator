//
//  DeltaCoreProtocol.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation
import AVFoundation

protocol DeltaCoreProtocol: CustomStringConvertible {
    /* General */
    var name: String { get }
    var identifier: String { get }
    var version: String? { get }
    
    var gameType: GameType { get }
    var gameSaveFileExtension: String { get }
    
    // Should be associated type, but Swift type system makes this difficult, so ¯\_(ツ)_/¯
    var gameInputType: Input.Type { get }
    
    /* Rendering */
    var audioFormat: AVAudioFormat { get }
    var videoFormat: VideoFormat { get }
    
    /* Cheats */
    var supportedCheatFormats: Set<CheatFormat> { get }
    
    /* Emulation */
    var emulatorBridge: EmulatorBridging { get }
    
    var resourceBundle: Bundle { get }
}

extension DeltaCoreProtocol {
    var version: String? {
        return nil
    }
    
    var resourceBundle: Bundle {
        #if FRAMEWORK
        let bundle = Bundle(for: type(of: self.emulatorBridge))
        #elseif STATIC_LIBRARY || SWIFT_PACKAGE
        let bundle: Bundle
        if let bundleURL = Bundle.main.url(forResource: self.name, withExtension: "bundle")
        {
            bundle = Bundle(url: bundleURL)!
        }
        else
        {
            bundle = Bundle(for: type(of: self.emulatorBridge))
        }
        #else
        let bundle = Bundle.main
        #endif
        
        return bundle
    }
    
    var directoryURL: URL {
       // let directoryURL = Delta.coresDirectoryURL.appendingPathComponent(self.name, isDirectory: true)
        let directoryURL = FileManager.default.temporaryDirectory.appendingPathComponent(self.name, isDirectory: true)

        try? FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        
        return directoryURL
    }
}

extension DeltaCoreProtocol {
    var description: String {
        let description = "\(self.name) (\(self.identifier))"
        return description
    }
}

func ==(lhs: DeltaCoreProtocol?, rhs: DeltaCoreProtocol?) -> Bool
{
    return lhs?.identifier == rhs?.identifier
}

func !=(lhs: DeltaCoreProtocol?, rhs: DeltaCoreProtocol?) -> Bool
{
    return !(lhs == rhs)
}

func ~=(lhs: DeltaCoreProtocol?, rhs: DeltaCoreProtocol?) -> Bool
{
    return lhs == rhs
}

