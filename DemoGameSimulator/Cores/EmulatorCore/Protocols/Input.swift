//
//  Input.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation

enum InputType: Codable {
  //  case controller(GameControllerInputType)
    case game(GameType)
}

extension InputType: RawRepresentable {
    var rawValue: String {
        switch self {
        //case .controller(let inputType): return inputType.rawValue
        case .game(let gameType): return gameType.rawValue
        }
    }
    
    public init(rawValue: String) {
        let gameType = GameType(rawValue: rawValue) ?? .gba
        self = .game(gameType)
//        if Delta.core(for: gameType) != nil {
//            self = .game(gameType)
//        } else {
//            let inputType = GameControllerInputType(rawValue)
//            self = .controller(inputType)
//        }
    }
}

extension InputType: Hashable {
    public func hash(into hasher: inout Hasher)
    {
        hasher.combine(self.rawValue)
    }
}

/// "Private" parent protocol allows types to conform at declaration without having
/// to implement the full Input protocol (which might require circular dependencies).
///
/// Inheriting from CodingKey allows compiler to automatically generate intValue/stringValue logic for enums.
protocol _Input: CodingKey {
    var stringValue: String { get }
    var intValue: Int? { get }
    
    init?(stringValue: String)
    init?(intValue: Int)
}

protocol Input: _Input {
    var type: InputType { get }
    var isContinuous: Bool { get }
}

extension Input where Self: RawRepresentable, RawValue == String {
    var stringValue: String {
        return self.rawValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    init?(stringValue: String)
    {
        self.init(rawValue: stringValue)
    }
    
    init?(intValue: Int) {
        return nil
    }
}

extension Input {
    var isContinuous: Bool {
        return false
    }
    
    init?(input: Input) {
        self.init(stringValue: input.stringValue)
        
        guard self.type == input.type else { return nil }
    }
}

func ==(lhs: Input?, rhs: Input?) -> Bool {
    return lhs?.type == rhs?.type && lhs?.stringValue == rhs?.stringValue
}

func !=(lhs: Input?, rhs: Input?) -> Bool {
    return !(lhs == rhs)
}

func ~=(pattern: Input?, value: Input?) -> Bool {
    return pattern == value
}

