//
//  FrequencyPickerView.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//


import SwiftUI

struct FrequencyPickerView: View {
    @ObservedObject var vm: CreateSubscriptionViewModel

    let frequencies = [
        Frequency(title: "Weekly"),
        Frequency(title: "Monthly"),
        Frequency(title: "Annually")
    ]

    var body: some View {
        NavigationStack {
            List(frequencies) { freq in
                Button {
                    vm.selectedFrequency = freq
                } label: {
                    HStack {
                        Text(freq.title)
                        Spacer()
                        if freq.title == vm.selectedFrequency.title {
                            Image("CircleCheckFilled")
                                .frame(width: 18, height: 18)
                        }
                    }
                }
            }
            .navigationTitle("Frequency")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { vm.showFrequencyPicker = false }
                        .foregroundColor(ColorTheme.actionBlue)
                        .fontWeight(.medium)
                }
            }
        }
    }
}
