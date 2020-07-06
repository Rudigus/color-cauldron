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
}
