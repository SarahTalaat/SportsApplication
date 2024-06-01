//
//  Constants.swift
//  SportsApplication
//
//  Created by Ahmed Refat on 22/05/2024.
//

import Foundation

class Constants {
    static let API_KEY = "9338996355241426c40a099d2ed1649c0982df743d1a4a5097ba8b2be41c5b6c"
    static let API_KEY2 = "dcfe2db90576c23689ab51880e9ab6a7e3f3f8c57b3a5f83c5dee71fb20c618f"
    
    static var currentDate: String {
        return formatDate(years: 0)
    }

    static var nextYear: String {
        return formatDate(years: 1)
    }

    static var previousYear: String {
        return formatDate(years: -1)
    }

    private static func formatDate(years: Int) -> String {
        let currentDate = Date()
        let futureDate = Calendar.current.date(byAdding: .year, value: years, to: currentDate) ?? currentDate

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        return dateFormatter.string(from: futureDate)
    }
}
