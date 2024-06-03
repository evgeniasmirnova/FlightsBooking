//
//  String+Extension.swift
//  FlightsBooking
//
//  Created by Евгения on 02.06.2024.
//

import Foundation

extension Date {
    func getFormattedDate(template: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate(template)
        let formattedDate = dateFormatter.string(from: self)
        
        return formattedDate
    }
    
    func getFlightTimeString(with date: Date) -> String {
        let seconds = Double(self.timeIntervalSince(date))
        
        
        let hours = Int(seconds / 3600)
        let minutes = Int((((seconds.truncatingRemainder(dividingBy: 3600.0)) / 60.0) / 10.0).rounded(.up))
        
        return String("\(hours)" + ".\(minutes)ч в пути")
    }
}
