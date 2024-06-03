import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    
    // MARK: - MusicArtist
    
    enum MusicArtist: String {
        case dieAntwoord = "dieAntwoord"
        case socratLera = "socratLera"
        case lampabict = "lampabict"
    }
    
    
    // MARK: - Properties
    
    @Published var musicFlightsData: [Offer] = []
    @Published var departureCityName: String = ""
    
    private var userDefaults = UserDefaults.standard
    
    
    // MARK: - Init
    
    init() {
        getMusicFlightsData()
        setCityNameFromCache()
    }
    
    
    // MARK: - Methods
    
    func getImage(model: Offer) -> String {
        switch model.id {
        case 1:
            return MusicArtist.dieAntwoord.rawValue
        case 2:
            return MusicArtist.socratLera.rawValue
        case 3:
            return MusicArtist.lampabict.rawValue
        default:
            return ""
        }
    }
    
    func departureCityNameWasChanged() {
        userDefaults.set(departureCityName, forKey: "DepartureCityName")
    }
    
    func setCityNameFromCache() {
        let cityName = userDefaults.string(forKey: "DepartureCityName")
        departureCityName = cityName ?? ""
    }
    
    
    // MARK: - Private methods
    
    private func getMusicFlightsData() {
        if let path = Bundle.main.path(forResource: "MusicFlightsJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                let decoder = JSONDecoder()
                let flightsData = try decoder.decode(MusicFlightsModel.self, from: data)
                musicFlightsData = flightsData.offers
            } catch {
                print(error)
            }
        }
    }
    
}
