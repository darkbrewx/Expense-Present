//
//  EditView.swift
//  Expense-Present
//
//  Created by 胡文博 on 2023/07/04.
//

import SwiftUI

struct EditView: View {
    private let types = ["日用百货","餐饮美食","数码电器","教育培训","充值缴费"]
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var expense: Expense
    @Binding var draftExpenseItem: ExpenseItem
   
    
    var body: some View {
        NavigationStack{
            Form {
                Section("账单名") {
                    TextField("收入或支出项目", text: $draftExpenseItem.name)
                }
                Section("账单分类") {
                    Picker("选择一个分类", selection: $draftExpenseItem.type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section("金额") {
                    TextField("收入或支出的金额", text: $draftExpenseItem.price)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("编辑账单")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        expense.editItem(draftItem: draftExpenseItem)
                        dismiss() //同时具备pop
                    } label: { Text("保存").foregroundColor(.primary) }
                    .padding(.horizontal)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.primary)
                    }

                }
            }
        }
    }
}
