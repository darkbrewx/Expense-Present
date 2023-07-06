//
//  Expense.swift
//  Expense-Present
//
//  Created by 胡文博 on 2023/07/04.
//

import Foundation

class Expense: ObservableObject {
    @Published
    var expenseItems = [
        ExpenseItem(name: "吃饭", type: "餐饮美食", price: "500"),
        ExpenseItem(name: "坐车", type: "交通出行", price: "600"),
        ExpenseItem(name: "买衣服", type: "日用百货", price: "20000")
    ]
    
    func editItem(draftItem: ExpenseItem) {
        let index = expenseItems.firstIndex {
            $0.id == draftItem.id
        }!
        expenseItems[index] = draftItem
    }
    
    func deleteItem(indexSet: IndexSet) {
        expenseItems.remove(atOffsets: indexSet)
    }
    
}
