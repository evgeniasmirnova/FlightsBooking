import Foundation

struct TicketsOffersData: Codable {
    let ticketsOffers: [TicketsOffers]
    
    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

struct TicketsOffers: Codable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: TicketPrice
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case timeRange = "time_range"
        case price = "price"
    }
}

struct TicketPrice: Codable {
    let value: Int
}
