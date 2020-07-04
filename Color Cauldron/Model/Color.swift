//
//  Color.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

struct Color: Codable {
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: UInt8
    
    init(r red: UInt8, g green: UInt8, b blue: UInt8, a alpha: UInt8) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}
