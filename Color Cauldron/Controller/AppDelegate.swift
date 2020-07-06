//
//  AppDelegate.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var colorPanelWindowController: ColorPanelWindowController!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        colorPanelWindowController = ColorPanelWindowController(windowNibName: "")
        colorPanelWindowController.window?.orderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @objc func openColorPanel(_ sender: Any) {
        if colorPanelWindowController.window!.isVisible {
            colorPanelWindowController.window?.close()
        } else {
            colorPanelWindowController.window?.makeKeyAndOrderFront(nil)
        }
    }

}

