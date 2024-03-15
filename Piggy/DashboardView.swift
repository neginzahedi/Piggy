//
//  DashboardView.swift
//  Piggy
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    
    // MARK: Properties
    @Environment(\.modelContext) private var modelContext
    @Query private var transactions: [Transaction]
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            VStack{
                CardView(title: "Total Balance", subTitle: "$3504.09", cardViewColor: Color.purple.opacity(0.5))
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                HStack(spacing: 10){
                    CardView(title: "Income", subTitle: "$3504.09", cardViewColor: Color.yellow.opacity(0.5))
                    CardView(title: "Expense", subTitle: "$3504.09", cardViewColor: Color.green.opacity(0.5))
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                VStack{
                    HStack{
                        Text("Recent Transaction")
                        Spacer()
                    }
                    ScrollView{
                        ForEach(transactions) { transaction in
                            RecentTransactionView(transaction: transaction)
                        }
                    }
                }
                .padding()
                Spacer()
            }
            .navigationTitle("Dashboard")
            .fontDesign(.rounded)
            .toolbar{
                ToolbarItem {
                    NavigationLink {
                        AddTransactionView()
                    } label: {
                        Image(systemName: "plus")

                    }
                }
            }
        }
    }
}

#Preview {
    DashboardView()
        .modelContainer(for: Transaction.self, inMemory: true)
}

// MARK: - CardView
struct CardView: View {
    
    // MARK: Properties
    var title: String
    var subTitle: String
    var cardViewColor: Color
    
    // MARK: Body
    var body: some View {
        VStack{
            Text(title)
            Text(subTitle)
        }
        .bold()
        .frame(maxWidth: .infinity)
        .padding(.vertical, 40)
        .background(cardViewColor)
        .cornerRadius(10)
    }
}
