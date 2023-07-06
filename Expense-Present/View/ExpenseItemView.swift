//
//  ExpenseItemView.swift
//  Expense-Present
//
//  Created by 胡文博 on 2023/07/04.
//

import SwiftUI

struct ExpenseItemView: View {
    var expenseItem: ExpenseItem
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(expenseItem.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(expenseItem.type)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(expenseItem.price)
                .foregroundColor(.primary)
        }
    }
}

struct ExpenseItemView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseItemView(expenseItem: ExpenseItem(name: "买衣服", type: "日用百货", price: "20000"))
    }
}
