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
//        (view as! DocumentView).colorCircle.bind(NSBindingName.value, to: self, withKeyPath: "representedObject.contentColor", options: [:])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //(view as! DocumentView).colorCircle.layer!.backgroundColor.
        // Do view setup here.
    }
    
    override func mouseDown(with event: NSEvent) {
        if event.type == .leftMouseDown {
            let hitView = view.hitTest(event.locationInWindow)
            // ColorCircle
            if hitView?.tag == 0 {
                (NSApplication.shared.delegate as! AppDelegate).colorPanelWindowController.window?.makeKeyAndOrderFront(nil)
            }
        }
    }
    
//    override func viewDidAppear() {
//        print(view.window)
//        print(view.window?.frame)
//        print(view.window?.windowController)
//    }
    
}
