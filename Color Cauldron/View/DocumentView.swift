//
//  DocumentView.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 04/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class DocumentView: NSView {
    
    lazy var colorView: NSView = {
        let colorView = NSView()
        colorView.wantsLayer = true
        colorView.layer?.backgroundColor = NSColor.red.cgColor
        return colorView
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        wantsLayer = true
        layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        addSubview(colorView)
        setupLayout()
    }
    
    func setupLayout() {
        colorView.translatesAutoresizingMaskIntoConstraints = false
        let circleRadius = NSScreen.main!.frame.size.width * 0.05
        NSLayoutConstraint.activate([
            colorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            colorView.widthAnchor.constraint(equalToConstant: circleRadius * 2),
            colorView.heightAnchor.constraint(equalToConstant: circleRadius * 2)
        ])
        colorView.layoutSubtreeIfNeeded()
        colorView.layer?.cornerRadius = colorView.frame.size.width / 2
    }
    
}
