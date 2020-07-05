//
//  DocumentViewController.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 04/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class DocumentViewController: NSViewController {
    
    override func loadView() {
        self.view = DocumentView(frame: NSRect(x: 0, y: 0, width: 200, height: 200))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    override func mouseDown(with event: NSEvent) {
        if event.type == .leftMouseDown {
            let hitView = view.hitTest(event.locationInWindow)
            // ColorCircle
            if hitView?.tag == 0 {
                let colorPanel = NSColorPanel()
                colorPanel.setTarget(self)
                colorPanel.setAction(#selector(didChangeColor(_:)))
                let windowController = NSWindowController(window: colorPanel)
                windowController.showWindow(nil)
            }
        }
    }
    
    @objc func didChangeColor(_ colorPanel: NSColorPanel) {
        // This is temporary. The right thing to do would first update the model, then propagate the changes to the view
        (view as! DocumentView).colorCircle.layer?.backgroundColor = colorPanel.color.cgColor
    }
    
//    override func viewDidAppear() {
//        print(view.window)
//        print(view.window?.frame)
//        print(view.window?.windowController)
//    }
    
}
