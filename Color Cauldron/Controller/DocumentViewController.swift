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
        self.view = DocumentView(frame: NSRect(x: 0, y: 0, width: 100, height: 100))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
//    override func viewDidAppear() {
//        print(view.window)
//        print(view.window?.frame)
//        print(view.window?.windowController)
//    }
    
}
