//
//  RecentTransactionView.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-15.
//

import SwiftUI

// MARK: - RecentTransactionView
struct RecentTransactionView: View {
    
    // MARK: Properties
    var transaction: Transaction
    
    // MARK: Body
    var body: some View {
        NavigationLink {
            Text("\(transaction.title)")
        } label: {
            HStack{
                Image(systemName: "house")
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
    
    func formattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
}


#Preview {
    RecentTransactionView(transaction: Transaction(title: "Netflix sub", amount: 9.99, type: "Expense", category: "Home", date: Date(), note: "some note here"))
}