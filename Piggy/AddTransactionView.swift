//
//  AddTransactionView.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-14.
//

import SwiftUI

struct AddTransactionView: View {
    
    // MARK: - Properties
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @StateObject private var viewModel = TransactionManager.shared
    
    // MARK: - Body
    
    var body: some View {
        VStack{
            Text("Enter the details  of the transaction to help you track your spending.")
                .foregroundStyle(.secondary)
            VStack{
                VStack(alignment: .leading){
                    Text("Title")
                    TextField("title", text: $viewModel.transaction.title)
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Amount")
                    TextField("Amount", value: $viewModel.transaction.amount, formatter: NumberFormatter())
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)
                
                HStack{
                    Text("Type")
                    Spacer()
                    Picker("Select a type", selection: $viewModel.transaction.type) {
                        ForEach(TransactionType.allCases, id: \.self) { type in
                            Text(type.rawValue)
                                .tag("\(type.rawValue)")
                        }
                    }
                }
                .padding(.vertical, 10)
                
                HStack{
                    Text("Category")
                    Spacer()
                    Picker("Select a Category", selection: $viewModel.transaction.category) {
                        if viewModel.transaction.type == "Income" {
                            ForEach(TransactionCategory.IncomeCategory.allCases, id: \.self) { category in
                                Text(category.rawValue)
                                    .tag(category.rawValue)
                            }
                        } else {
                            ForEach(TransactionCategory.ExpenseCategory.allCases, id: \.self) { category in
                                Text(category.rawValue)
                                    .tag(category.rawValue)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
                
                DatePicker("Date", selection: $viewModel.transaction.date, in: ...Date(), displayedComponents: .date)
                
                VStack(alignment: .leading){
                    Text("Note")
                    TextField("note", text: $viewModel.transaction.note)
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)
            }
            .padding()
        }
        
        .navigationTitle("New Transaction")
        .toolbar{
            ToolbarItem {
                Button("Add") {
                    modelContext.insert(viewModel.transaction)
                    dismiss()
                }
                .disabled(viewModel.transaction.title.isEmpty)
            }
        }
    }
    
}

#Preview {
    AddTransactionView()
}
