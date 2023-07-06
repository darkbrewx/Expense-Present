//
//  ContentView.swift
//  Expense-Present
//
//  Created by 胡文博 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    @State private var showEditView = false
    @State private var drafExpenseItem = ExpenseItem(name: "买衣服", type: "日用百货", price: "20000")
    @StateObject var expense = Expense()
    var body: some View {
        NavigationView {
            List {
                ForEach(expense.expenseItems) { expenseItem in
                    Button {
                        drafExpenseItem = expenseItem
                        showEditView = true
                    } label: {
                        ExpenseItemView(expenseItem: expenseItem)
                    }
                }
                .onDelete { indexSet in
                    expense.deleteItem(indexSet: indexSet)
                }
            }
            .navigationTitle("账单")
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showEditView) {
            EditView(expense: expense, draftExpenseItem: $drafExpenseItem)
        }
//        .fullScreenCover(isPresented: $showEditView) {
//            EditView(expense: expense, draftExpenseItem: $drafExpenseItem)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
