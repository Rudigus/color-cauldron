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
        self.view = DocumentView(frame: NSRect(x: 0, y: 0, width: 400, height: 400))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackgroundColor(_:)), name: .shouldInitializeBackgroundColor, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBackgroundColor(_:)), name: .shouldUpdateBackgroundColor, object: nil)
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
    
    @objc func updateBackgroundColor(_ notification: NSNotification) {
        
        switch notification.name {
        case .shouldInitializeBackgroundColor:
            let color = (notification.object as! Content).contentColor
            (view as! DocumentView).colorCircle.layer?.backgroundColor = color.toCGColor()!
            NotificationCenter.default.removeObserver(self, name: .shouldInitializeBackgroundColor, object: nil)
        case .shouldUpdateBackgroundColor:
            if NSApplication.shared.mainWindow == view.window {
                let color = (notification.object as! Content).contentColor
                (view as! DocumentView).colorCircle.layer?.backgroundColor = color.toCGColor()!
            }
        default:
            break
        }
        
    }
    
}
