//
//  Content.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class Content: NSObject {
    
    var contentColor: Color
    
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
