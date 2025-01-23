//
//  VideoFormat.swift
//  DemoGameSimulator
//
//  Created by Duc apple  on 23/1/25.
//

import CoreGraphics
import CoreImage

struct VideoFormat: Equatable {
    var format: Format
    var dimensions: CGSize
    
    init(format: Format, dimensions: CGSize) {
        self.format = format
        self.dimensions = dimensions
    }
}

extension VideoFormat {
    enum Format: Equatable {
        case bitmap(PixelFormat)
        case openGLES2
        case openGLES3
    }
    
    enum PixelFormat: Equatable {
        case rgb565
        case bgra8
        case rgba8
        
        public var bytesPerPixel: Int {
            switch self {
            case .rgb565: return 2
            case .bgra8: return 4
            case .rgba8: return 4
            }
        }
    }
}

