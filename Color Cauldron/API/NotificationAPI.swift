//
//  NotificationAPI.swift
//  Color Cauldron
//
//  Created by Rodrigo Matos Aguiar on 07/07/20.
//  Copyright © 2020 Rudigus. All rights reserved.
//

import Foundation

extension NSNotification.Name {
    
    /// This notification is sent when the color circle's background color should be updated.
    static var shouldUpdateBackgroundColor: NSNotification.Name {
        return .init("shouldUpdateBackgroundColor")
    }
    
}
