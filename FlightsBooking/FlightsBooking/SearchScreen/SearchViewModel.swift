import Foundation

class SearchViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var departureCityName: String = ""
    private var userDefaults = UserDefaults.standard
    
    
    // MARK: - Init
    
    init() {
        setCityNameFromCache()
    }
    
    
    // MARK: - Methods
    
    func setCityNameFromCache() {
        let cityName = userDefaults.string(forKey: "DepartureCityName")
        departureCityName = cityName ?? ""
    }
    
}
