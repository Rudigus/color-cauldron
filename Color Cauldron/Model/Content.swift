//
//  Content.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class Content: NSObject {
    
    var contentColor: Color {
        didSet {
        (NSApplication.shared.mainWindow!.contentView as! DocumentView).colorCircle.layer!.backgroundColor = CGColor(red: CGFloat(contentColor.components[0]) / 255, green: CGFloat(contentColor.components[1]) / 255, blue: CGFloat(contentColor.components[2]) / 255, alpha: CGFloat(contentColor.components[3]) / 255)
        }
    }
    
    public init(contentColor: Color) {
        self.contentColor = contentColor
    }
    
}
    
extension Content {
        
    func read(from data: Data) throws {
        if let contentColor = try? JSONDecoder().decode(Color.self, from: data) {
            self.contentColor = contentColor
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }
    
    func data() -> Data? {
        return try? JSONEncoder().encode(contentColor)
    }
    
}
