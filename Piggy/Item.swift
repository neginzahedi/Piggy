//
//  Item.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-11.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
