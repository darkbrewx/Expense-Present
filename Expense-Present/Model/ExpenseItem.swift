//
//  ExpenseItem.swift
//  Expense-Present
//
//  Created by 胡文博 on 2023/07/04.
//

import Foundation

struct ExpenseItem: Identifiable {
    let id = UUID()
    var name: String
    var type: String
    var price: String
}
