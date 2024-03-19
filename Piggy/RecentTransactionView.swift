//
//  RecentTransactionView.swift
//  Piggy
//

import SwiftUI

struct RecentTransactionView: View {
    
    // MARK: - Properties
    
    @StateObject private var viewModel = TransactionManager.shared
    var transaction: Transaction
    
    // MARK: - Body
    
    var body: some View {
        NavigationLink {
            Text("\(transaction.title)")
        } label: {
            HStack{
                Image(systemName: getSystemImageName(for: transaction.category))
                    .font(.title2)
                    .padding(10)
                    .background(Color.blue.opacity(0.5))
                    .cornerRadius(10)
                
                VStack(alignment: .leading){
                    Text(transaction.title)
                        .bold()
                    
                    Text(transaction.category)
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
                Spacer()
                VStack(alignment: .trailing){
                    Text("$\(String(format: "%.2f", transaction.amount))")
                        .foregroundStyle(transaction.type == "Expense" ? .red : .green)
                    Text(formattedDate(date: transaction.date))
                        .foregroundStyle(.secondary)
                        .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .cornerRadius(10)
            .foregroundStyle(.black)
        }
    }
    
    // MARK: - Helper Functions
    
    // Format date for display
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    // Get system image name based on transaction category
    func getSystemImageName(for category: String) -> String {
        if transaction.type == "Income"{
            if let transactionCategory = TransactionCategory.IncomeCategory(rawValue: category) {
                return transactionCategory.systemImageName
            } else {
                return "questionmark.circle" // Default image name for unknown category
            }
        } else {
            if let transactionCategory = TransactionCategory.ExpenseCategory(rawValue: category) {
                return transactionCategory.systemImageName
            } else {
                return "questionmark.circle" // Default image name for unknown category
            }
        }
    }
}

// MARK: - Preview

#Preview {
    RecentTransactionView(transaction: Transaction(title: "Netflix sub", amount: 9.99, type: "Expense", category: "Home", date: Date(), note: "some note here"))
}
