//
//  DatePickerSheet.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//


import SwiftUI

struct DatePickerSheet: View {
    @ObservedObject var vm: CreateSubscriptionViewModel

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "",
                    selection: $vm.startDate,
                    displayedComponents: .date
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
            }
            .navigationTitle("Start Date")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { vm.showDatePicker = false }
                        .foregroundColor(ColorTheme.actionBlue)
                        .fontWeight(.medium)
                }
            }
        }
    }
}
