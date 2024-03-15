//
//  AddTransactionViewModel.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-15.
//

import Foundation
import SwiftUI

class AddTransactionViewModel: ObservableObject{
    
    @Environment(\.modelContext) private var modelContext
    @Published var transaction: Transaction
    
    init() {
        self.transaction = Transaction(title: "", amount: 0.0, type: TransactionType.income.rawValue, category: TransactionCategory.IncomeCategory.salary.rawValue, date: Date(), note: "")
    }
    
    func saveTransaction(){
        modelContext.insert(transaction)
    }
}
