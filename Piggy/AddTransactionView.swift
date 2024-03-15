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
    @State var transaction : Transaction = Transaction(title: "", amount: 0.0, type: "Income", category: "Home", date: Date(), note: "")
    let types : [String] = ["Income", "Expense"]
    let categories : [String] = ["Home", "Transport", "Food"]
    
    // MARK: - Body
    var body: some View {
        VStack{
            Text("Enter the details  of the transaction to help you track your spending.")
                .foregroundStyle(.secondary)
            VStack{
                VStack(alignment: .leading){
                    Text("Title")
                    TextField("title", text: $transaction.title)
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Amount")
                    TextField("Amount", value: $transaction.amount, formatter: NumberFormatter())
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)

                HStack{
                    Text("Type")
                    Spacer()
                    Picker("Select a type", selection: $transaction.type) {
                        ForEach(types, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                .padding(.vertical, 10)
                
                HStack{
                    Text("Category")
                    Spacer()
                    Picker("Select a Category", selection: $transaction.category) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                        }
                    }
                }
                .padding(.vertical, 10)
                
                DatePicker("Date", selection: $transaction.date, in: ...Date(), displayedComponents: .date)
                
                VStack(alignment: .leading){
                    Text("Note")
                    TextField("note", text: $transaction.note)
                        .padding(10)
                        .border(Color.secondary)
                }
                .padding(.vertical, 10)
            }
            .padding()
            
            Button("Add New Transaction") {
                modelContext.insert(transaction)
            }

        }
        
        .navigationTitle("New Transaction")
    }
    
}

#Preview {
    AddTransactionView()
}
