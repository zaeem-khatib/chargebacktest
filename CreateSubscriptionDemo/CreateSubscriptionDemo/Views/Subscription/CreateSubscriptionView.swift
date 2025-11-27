//
//  CreateSubscriptionView.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//


import SwiftUI

struct CreateSubscriptionView: View {

    @StateObject private var vm = CreateSubscriptionViewModel()
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                
                ColorTheme.pageBackgroundGray.ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {

                        // MARK: - Service Selector Card
                        Button {
                            vm.showServicePicker = true
                        } label: {
                            serviceSelectorCard
                        }

                        // MARK: - Name / Amount / Category Card
                        VStack(spacing: 0) {
                            formRow(title: "Name", value: vm.selectedService?.name.isEmpty ?? true ? "Enter name" : vm.selectedService!.name) {
                                vm.showServicePicker = true
                            }
                            divider
                            formRowValueUnderlined(title: "Amount", value: vm.selectedService == nil ? "$0" : "\(vm.selectedService!.priceLabel)") {
                            }
                            divider
                            formRowWithIcon(
                                title: "Category",
                                value: vm.selectedCategory.name,
                                icon: vm.selectedCategory.icon
                            ) {
                                vm.showCategoryPicker = true
                            }
                        }
                        .roundedCard()

                        // MARK: - Date / Frequency / Active
                        VStack(spacing: 0) {
                            formRowDateStyle(title: "Start Date", value: vm.startDate.asShortDate) {
                                vm.showDatePicker = true
                            }
                            divider
                            formRow(title: "Frequency", value: vm.selectedFrequency.title) {
                                vm.showFrequencyPicker = true
                            }
                            divider
                            Toggle("Active", isOn: $vm.isActive)
                                .foregroundColor(ColorTheme.formTitleGray)
                                .tint(ColorTheme.actionBlue)
                                .padding(.horizontal)
                                .frame(height: 56)
                        }
                        .roundedCard()
                    }
                    .padding()
            }
        }
            .navigationTitle("Create Subscription")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    leadingButton
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        dismiss()
                    }
                    .fontWeight(.medium)
                    .disabled(!vm.isFormValid)
                    .foregroundColor(vm.isFormValid ? ColorTheme.actionBlue : ColorTheme.placeholderTextGray)
                }
            }
        }
        .sheet(isPresented: $vm.showServicePicker) {
            ServicePickerView(viewModel: vm)
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.showCategoryPicker) {
            CategoryPickerView(vm: vm)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.showDatePicker) {
            DatePickerSheet(vm: vm)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.showFrequencyPicker) {
            FrequencyPickerView(vm: vm)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
        }
    }

    // MARK: - Components

    private var leadingButton: some View {
        Group {
            if vm.isFormDirty {
                Button {
                    vm.reset()
                } label: {
                    Image("Back")
                }
            } else {
                Button {
                    dismiss()
                } label: {
                    Image("Close")
                }
            }
        }
    }

    private var serviceSelectorCard: some View {
        HStack {
            if let service = vm.selectedService {
                Image(service.icon)
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment: .leading, spacing: 2) {
                    Text(service.name)
                        .font(.headline)
                        .foregroundColor(ColorTheme.textRegular)
                    Text(service.priceLabel)
                        .font(.subheadline)
                        .foregroundColor(ColorTheme.subtitleGray)
                }
                Spacer()
                Image("ChevronUpDown")
            } else {
                HStack(spacing: 14) {
                    Image("Plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding()
                        .background(
                            Circle()
                                .fill(Color(red: 235/255, green: 238/255, blue: 255/255))
                        )
                        .frame(width: 50, height: 50)
                    Text("Choose a service")
                        .foregroundColor(ColorTheme.placeholderTextGray)
                    Spacer()
                    Image("ChevronUpDown")
                }
            }
        }
        .frame(height: 90)
        .padding(.horizontal)
        .roundedCard()
    }
}

private var divider: some View {
    Rectangle().fill(Color(.systemGray5)).frame(height: 1)
}

private func formRow(title: String, value: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
        HStack {
            Text(title)
                .foregroundColor(ColorTheme.formTitleGray)
            Spacer()
            Text(value)
                .foregroundColor(ColorTheme.textRegular)
            Image("ChevronUpDown")
        }
        .padding(.horizontal)
        .frame(height: 56)
    }
}

private func formRowValueUnderlined(title: String, value: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
        HStack {
            Text(title)
                .foregroundColor(ColorTheme.formTitleGray)
            Spacer()
            Text(value)
                .foregroundColor(ColorTheme.textRegular)
                .underline()
            Image("ChevronUpDown")
        }
        .padding(.horizontal)
        .frame(height: 56)
    }
}

private func formRowDateStyle(title: String, value: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
        HStack {
            Text(title)
                .foregroundColor(ColorTheme.formTitleGray)
            Spacer()
            Text(value)
                .padding(8)
                .foregroundColor(ColorTheme.textRegular)
                .background(ColorTheme.buttonBackgroundGray)
                .cornerRadius(8)
        }
        .padding(.horizontal)
        .frame(height: 56)
    }
}

private func formRowWithIcon(title: String, value: String, icon: String, action: @escaping () -> Void) -> some View {
    Button(action: action) {
        HStack {
            Text(title)
                .foregroundColor(ColorTheme.formTitleGray)
            Spacer()
            Image(systemName: icon)
            Text(value)
                .foregroundColor(ColorTheme.textRegular)
            Image("ChevronUpDown")
        }
        .padding(.horizontal)
        .frame(height: 56)
    }
}
