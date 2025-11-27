//
//  ServicePickerView.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//
import SwiftUI

struct ServicePickerView: View {

    @ObservedObject var viewModel: CreateSubscriptionViewModel

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {

                // SEARCH BAR
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    TextField("Search", text: $viewModel.searchText)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.top, 10)

                // LIST OF SERVICES
                List {
                    ForEach(viewModel.filteredServices) { service in
                        Button {
                            viewModel.select(service)
                            viewModel.showServicePicker = false
                        } label: {
                            HStack {
                                Image(service.icon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)

                                Text(service.name)

                                Spacer()

                                if viewModel.selectedService?.id == service.id {
                                    Image("CircleCheckFilled")
                                        .frame(width: 18, height: 18)
                                }
                            }
                            .padding(.vertical, 6)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Services")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { viewModel.showServicePicker = false }
                        .foregroundColor(ColorTheme.actionBlue)
                        .fontWeight(.medium)
                }
            }
        }
    }
}
