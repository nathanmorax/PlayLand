//
//  String+Extension.swift
//  PlayLand
//
//  Created by Jonathan Mora on 20/10/25.
//
import SwiftUI

let monthYearFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.dateFormat = "MMMM yyyy"
    return formatter
}()


extension String {
    func toMonthYear() -> String {
        let isoFormatter = ISO8601DateFormatter()
        isoFormatter.formatOptions = [.withInternetDateTime]

        guard let date = isoFormatter.date(from: self) else {
            return ""
        }

        return monthYearFormatter.string(from: date).capitalized
    }
}
