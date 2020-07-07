//
//  IdentifiedView.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 05/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class TaggedView: NSView {

    var _tag = -1
    
    override var tag: Int {
        get {
            return _tag
        }
    }
    
    init(tag: Int) {
        self._tag = tag
        super.init(frame: NSZeroRect)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
