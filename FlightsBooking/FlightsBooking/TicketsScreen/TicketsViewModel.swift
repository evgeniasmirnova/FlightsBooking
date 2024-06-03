import Foundation

class TicketsViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var ticketsData: [Ticket] = []
    @Published var departureCityName: String = ""
    private var userDefaults = UserDefaults.standard
    
    
    // MARK: - Init
    
    init() {
        setCityNameFromCache()
        getTicketsData()
    }
    
    
    // MARK: - Methods
    
    func setCityNameFromCache() {
        let cityName = userDefaults.string(forKey: "DepartureCityName")
        departureCityName = cityName ?? ""
    }
    
    
    // MARK: - Private methods
    
    private func getTicketsData() {
        if let path = Bundle.main.path(forResource: "AllTicketsJSON", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(filePath: path))
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(TicketsData.self, from: data)
                ticketsData = jsonData.tickets
            } catch {
                print(error)
            }
        }
    }
    
}
