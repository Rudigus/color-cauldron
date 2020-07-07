//
//  Color.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

enum ColorModel: String, Codable {
    case rgb = "RGB", cmyk = "CMYK", monochrome = "Monochrome", unknown = "Unknown"
}

struct Color: Codable {
    let model: ColorModel
    let components: [UInt8]
    
    init(r red: UInt8, g green: UInt8, b blue: UInt8, a alpha: UInt8) {
        self.model = .rgb
        self.components = [red, green, blue, alpha]
    }

    init() {
        self.init(r: 255, g: 255, b: 255, a: 255)
    }
    
    init(cgColor: CGColor) {
        switch cgColor.colorSpace?.model {
        case .rgb:
            self.model = .rgb
        case .cmyk:
            self.model = .cmyk
        case .monochrome:
            self.model = .monochrome
        default:
            self.model = .unknown
        }
        self.components = cgColor.components!.map { UInt8($0 * 255) }
    }
    
    func toCGColor() -> CGColor? {
        var cgColor: CGColor?
        switch model {
        case .rgb:
            cgColor = CGColor(red: CGFloat(components[0]) / 255, green: CGFloat(components[1]) / 255, blue: CGFloat(components[2]) / 255, alpha: CGFloat(components[3]) / 255)
        case .cmyk:
            cgColor = CGColor(genericCMYKCyan: CGFloat(components[0]) / 255, magenta: CGFloat(components[1]) / 255, yellow: CGFloat(components[2]) / 255, black: CGFloat(components[3]) / 255, alpha: CGFloat(components[4]) / 255)
        case .monochrome:
            cgColor = CGColor(gray: CGFloat(components[0]) / 255, alpha: CGFloat(components[1]) / 255)
        case .unknown:
            cgColor = nil
        }
        return cgColor
    }
}
