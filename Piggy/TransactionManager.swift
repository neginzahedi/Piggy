//
//  TransactionManager.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-15.
//

import Foundation
import SwiftUI

class TransactionManager: ObservableObject{
    
    // MARK: - Properties
    
    @Published var transaction: Transaction
    
    // MARK: - Singleton
    
    static var shared = TransactionManager()
    
    // MARK: - init
    
    init() {
        self.transaction = Transaction(title: "", amount: 0.0, type: TransactionType.income.rawValue, category: TransactionCategory.IncomeCategory.salary.rawValue, date: Date(), note: "")
    }
}
