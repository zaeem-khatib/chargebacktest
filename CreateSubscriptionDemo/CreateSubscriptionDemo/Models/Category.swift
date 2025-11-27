//
//  Category.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//


import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
}
