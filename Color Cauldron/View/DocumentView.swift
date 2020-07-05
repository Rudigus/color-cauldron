//
//  DocumentView.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 04/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Cocoa

class DocumentView: NSView {
    
    lazy var colorCircle: TaggedView = {
        let view = TaggedView(tag: 0)
        view.wantsLayer = true
        view.layer?.backgroundColor = NSColor.white.cgColor
        return view
    }()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
//        wantsLayer = true
//        layer?.backgroundColor = NSColor.windowBackgroundColor.cgColor
        addSubview(colorCircle)
        setupLayout()
    }
    
    func setupLayout() {
        colorCircle.translatesAutoresizingMaskIntoConstraints = false
        let circleRadius = NSScreen.main!.frame.size.width * 0.05
        NSLayoutConstraint.activate([
            colorCircle.centerXAnchor.constraint(equalTo: centerXAnchor),
            colorCircle.centerYAnchor.constraint(equalTo: centerYAnchor),
            colorCircle.widthAnchor.constraint(equalToConstant: circleRadius * 2),
            colorCircle.heightAnchor.constraint(equalToConstant: circleRadius * 2)
        ])
        colorCircle.layoutSubtreeIfNeeded()
        colorCircle.layer?.cornerRadius = colorCircle.frame.size.width / 2
    }
    
}
