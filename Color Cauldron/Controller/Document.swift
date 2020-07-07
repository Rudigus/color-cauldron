//
//  Document.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 03/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    @objc var content = Content(contentColor: Color())

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override func makeWindowControllers() {
        let documentWindow = NSWindow(contentViewController: DocumentViewController())
        //MARK: Notification Post
        NotificationCenter.default.post(name: .shouldUpdateBackgroundColor, object: content)
        documentWindow.tabbingMode = .preferred
        let documentWindowController = DocumentWindowController(window: documentWindow)
        addWindowController(documentWindowController)
        
        documentWindowController.contentViewController?.representedObject = self.content
    }

    override func data(ofType typeName: String) throws -> Data {
        if let data = content.data() {
            return data
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        do {
            try self.content.read(from: data)
        } catch {
            throw error
        }
    }


}

