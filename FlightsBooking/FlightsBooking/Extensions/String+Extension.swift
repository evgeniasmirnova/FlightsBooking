//
//  String+Extension.swift
//  FlightsBooking
//
//  Created by Евгения on 02.06.2024.
//

import Foundation

extension String {
    func getDateFromString() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = dateFormatter.date(from: self)
        
        return date
    }
}
