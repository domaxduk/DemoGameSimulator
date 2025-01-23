//
//  AudioRendering.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import Foundation

@objc(DLTAAudioRendering)
protocol AudioRendering: NSObjectProtocol {
    var audioBuffer: RingBuffer { get }
}
