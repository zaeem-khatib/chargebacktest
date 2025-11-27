//
//  Service.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//


import Foundation

struct Service: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
    let icon: String
    
    var priceLabel: String {
        "$\(Int(price))"
    }
}
