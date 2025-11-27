//
//  CategoryPickerView.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//

import SwiftUI

struct CategoryPickerView: View {
    @ObservedObject var vm: CreateSubscriptionViewModel

    let categories: [Category] = [
        .init(name: "Subscription", icon: "arrow.triangle.2.circlepath"),
        .init(name: "Utility", icon: "wrench"),
        .init(name: "Card Payment", icon: "creditcard"),
        .init(name: "Loan", icon: "dollarsign.circle"),
        .init(name: "Rent", icon: "house")
    ]

    var body: some View {
        NavigationStack {
            List(categories) { category in
                Button {
                    vm.selectedCategory = category
                } label: {
                    HStack {
                        Image(systemName: category.icon)
                        Text(category.name)
                        Spacer()
                        if category.name == vm.selectedCategory.name {
                            Image("CircleCheckFilled")
                                .frame(width: 18, height: 18)
                        }
                    }
                }
            }
            .navigationTitle("Category")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { vm.showCategoryPicker = false }
                        .foregroundColor(ColorTheme.actionBlue)
                        .fontWeight(.medium)
                }
            }
        }
    }
}
