//
//  TransactionEnums.swift
//  Piggy
//
//  Created by Negin Zahedi on 2024-03-15.
//

import Foundation

enum TransactionType: String, CaseIterable {
    case income = "Income"
    case expense = "Expense"
}

enum TransactionCategory {
    case income(IncomeCategory)
    case expense(ExpenseCategory)
    
    enum IncomeCategory: String, CaseIterable {
        case salary = "Salary"
        case freelance = "Freelance"
        case investments = "Investments"
        case gifts = "Gifts"
        case govermentBenefits = "Government Benefits"
        case businessIncome = "Business Income"
        case rentalIncome = "Rental Income"
        case other = "Other"
        
        var systemImageName: String {
            switch self {
            case .salary:
                return "dollarsign"
            case .freelance:
                return "pencil"
            case .investments:
                return "chart.line.uptrend.xyaxis"
            case .gifts:
                return "gift"
            case .govermentBenefits:
                return "building.columns"
            case .businessIncome:
                return "briefcase"
            case .rentalIncome:
                return "building"
            case .other:
                return "creditcard"
            }
        }
    }
    
    enum ExpenseCategory: String, CaseIterable {
        case food = "Food and Dining"
        case transportation = "Transportation"
        case housing = "Housing"
        case utilities = "Utilities"
        case healthcare = "Healthcare"
        case entertainment = "Entertainment"
        case personalCare = "Personal Care"
        case education = "Education"
        case debtPayments = "Debt Payments"
        case shopping = "Shopping"
        case other = "Other"
        
        var systemImageName: String {
            switch self {
            case .food:
                return "takeoutbag.and.cup.and.straw"
            case .transportation:
                return "car"
            case .housing:
                return "house"
            case .utilities:
                return "bolt"
            case .healthcare:
                return "bandage"
            case .entertainment:
                return "gamecontroller"
            case .personalCare:
                return "person"
            case .education:
                return "books.vertical"
            case .debtPayments:
                return "banknote"
            case .shopping:
                return "cart"
            case .other:
                return "creditcard"
            }
        }
    }
    
    var systemImageName: String {
        switch self {
        case .income(let category): return category.systemImageName
        case .expense(let category): return category.systemImageName
        }
    }
}
