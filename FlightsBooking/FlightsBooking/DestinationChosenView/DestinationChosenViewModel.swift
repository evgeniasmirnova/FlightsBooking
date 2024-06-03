import Foundation
import SwiftUI

class DestinationChosenViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var departureCityName: String = ""
    @Published var departureDate = Date()
    @Published var offersData: [TicketsOffers] = []
    private var userDefaults = UserDefaults.standard
    
    
    // MARK: - Init
    
    init() {
        setCityNameFromCache()
        getOffersData()
    }
    
    
    // MARK: - Methods
    
    func setCityNameFromCache() {
        let cityName = userDefaults.string(forKey: "DepartureCityName")
        departureCityName = cityName ?? ""
    }
    
    func getDayOfWeek(date: Date) -> String {
        let dayOfWeekformatter = DateFormatter()
        dayOfWeekformatter.locale = Locale(identifier: "ru_RU")
        dayOfWeekformatter.setLocalizedDateFormatFromTemplate("EEE")
        let dayOfWeek = ", " + dayOfWeekformatter.string(from: date)
        
        return dayOfWeek.lowercased()
    }
    
    func getFormattedDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("dd MMM")
        let formattedDate = dateFormatter.string(from: date)
        
        return formattedDate
    }
    
    func getTimesString(model: TicketsOffers) -> String {
        var timesString = ""
        for time in model.timeRange {
            timesString += time + "  "
        }
        return timesString
    }
    
    func getColor(model: TicketsOffers) -> Color {
        switch model.id {
        case 1:
            return Color(red: 1, green: 0.369, blue: 0.369)
        case 10:
            return Color(red: 0.133, green: 0.38, blue: 0.737)
        case 30:
            return Color.white
        default:
            return Color.clear
        }
    }
    
    
    // MARK: - Private methods
    
    private func getOffersData() {
        if let path = Bundle.main.path(forResource: "SearchScreenJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TicketsOffersData.self, from: data)
                offersData = jsonData.ticketsOffers
            } catch {
                print(error)
            }
        }
    }
    
}
