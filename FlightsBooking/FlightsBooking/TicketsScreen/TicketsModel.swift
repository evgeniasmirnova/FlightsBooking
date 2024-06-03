import Foundation

struct TicketsData: Codable {
    let tickets: [Ticket]
}

struct Ticket: Codable {
    let id: Int
    let badge: String?
    let price: FlightPrice
    let providerName: String
    let company: String
    let departure: DepartureArrival
    let arrival: DepartureArrival
    let hasTransfer: Bool

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case badge = "badge"
        case price = "price"
        case providerName = "provider_name"
        case company = "company"
        case departure = "departure"
        case arrival = "arrival"
        case hasTransfer = "has_transfer"
    }
}


struct FlightPrice: Codable {
    let value: Int
}


struct DepartureArrival: Codable {
    let town: Town
    let date: String
    let airport: Airport
}


enum Town: String, Codable {
    case москва = "Москва"
    case сочи = "Сочи"
}


enum Airport: String, Codable {
    case aer = "AER"
    case vko = "VKO"
}
