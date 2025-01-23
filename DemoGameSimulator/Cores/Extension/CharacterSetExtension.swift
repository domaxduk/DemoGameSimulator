//
//  CharacterSetExtension.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation

extension NSCharacterSet {
    @objc(hexadecimalCharacterSet)
    class var hexadecimals: NSCharacterSet {
        let characterSet = NSCharacterSet(charactersIn: "0123456789ABCDEFabcdef")
        return characterSet
    }
}

extension NSMutableCharacterSet {
    @objc(hexadecimalCharacterSet)
    override class var hexadecimals: NSMutableCharacterSet {
        let characterSet = NSCharacterSet.hexadecimals.mutableCopy() as! NSMutableCharacterSet
        return characterSet
    }
}

extension CharacterSet {
    static var hexadecimals: CharacterSet {
        return NSCharacterSet.hexadecimals as CharacterSet
    }
}

