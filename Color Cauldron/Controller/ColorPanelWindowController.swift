//
//  ColorPanelWindowController.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 05/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class ColorPanelWindowController: NSWindowController {
    
    override init(window: NSWindow?) {
        super.init(window: window)
    }
    
    override func loadWindow() {
        window = NSColorPanel.shared
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        (window as! NSColorPanel).setTarget(self)
        (window as! NSColorPanel).setAction(#selector(didChangeColor(_:)))
    }
    
    @objc func didChangeColor(_ colorPanel: NSColorPanel) {
        // This is temporary. The right thing to do would first update the model, then propagate the changes to the view
        //print("Color changed")
        //(view as! DocumentView).colorCircle.layer?.backgroundColor = colorPanel.color.cgColor
    }

}
