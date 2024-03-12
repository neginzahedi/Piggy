//
//  Transaction.swift
//  Piggy
//

import Foundation
import SwiftData

@Model
final class Transaction {
    var title: String
    var amount: Double
    var type: String
    var category: String
    var date: Date
    var note: String
    
    init(title: String, amount: Double, type: String, category: String, date: Date, note: String) {
        self.title = title
        self.amount = amount
        self.type = type
        self.category = category
        self.date = date
        self.note = note
    }
}
