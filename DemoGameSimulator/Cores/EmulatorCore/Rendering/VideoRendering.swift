//
//  VideoRendering.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation
import CoreGraphics

@objc(DLTAVideoRendering)
public protocol VideoRendering: NSObjectProtocol
{
    var videoBuffer: UnsafeMutablePointer<UInt8>? { get }
    
    var viewport: CGRect { get set }
    
    func prepare()
    func processFrame()
}
