//
//  CreateSubscriptionViewModel.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//

import Foundation
import Combine

final class CreateSubscriptionViewModel: ObservableObject {

    // MARK: - Form state
    @Published var selectedService: Service?
    @Published var searchText: String = ""
    @Published var selectedCategory: Category = Category(name: "Subscription", icon: "arrow.triangle.2.circlepath")
    @Published var startDate: Date = Date()
    @Published var selectedFrequency: Frequency = Frequency(title: "Weekly")
    @Published var isActive: Bool = true

    // MARK: - Sheet control
    @Published var showServicePicker = false
    @Published var showCategoryPicker = false
    @Published var showDatePicker = false
    @Published var showFrequencyPicker = false
    
    let allServices: [Service] = [
        .init(name: "Netflix", price: 15, icon: "Netflix"),
        .init(name: "Hulu", price: 10, icon: "Hulu"),
        .init(name: "Spotify", price: 10, icon: "Spotify"),
        .init(name: "PlayStation+", price: 12, icon: "Playstation"),
        .init(name: "Paramount+", price: 10, icon: "Paramount"),
        .init(name: "YouTube Music", price: 12, icon: "Youtube"),
        .init(name: "Disney+", price: 13, icon: "Disney")
    ]

    // MARK: - Validation
    var isFormValid: Bool {
        selectedService != nil
    }

    var isFormDirty: Bool {
        selectedService != nil
    }

    // MARK: - Utilities
    func reset() {
        selectedService = nil
        startDate = Date()
        selectedCategory = Category(name: "Subscription", icon: "arrow.triangle.2.circlepath")
        selectedFrequency = Frequency(title: "Weekly")
        isActive = true
    }
    
    var filteredServices: [Service] {
        if searchText.isEmpty {
            return allServices
        }
        return allServices.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    func select(_ service: Service) {
        selectedService = service
    }
}
