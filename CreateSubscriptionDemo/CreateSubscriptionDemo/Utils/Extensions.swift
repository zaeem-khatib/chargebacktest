//
//  Extensions.swift
//  CreateSubscriptionDemo
//
//  Created by Zaeem on 27/11/25.
//

import SwiftUI

extension Color {
    static let cardBackground = Color(.systemGray6)
}

extension View {
    func roundedCard() -> some View {
        self
            .background(Color(.white))
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.05), radius: 32, x: 0, y: 0)
    }
}

extension Date {
    var asShortDate: String {
        let f = DateFormatter()
        f.dateFormat = "MMM dd, yyyy"
        return f.string(from: self)
    }
}

