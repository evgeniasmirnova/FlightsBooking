import Foundation

struct MusicFlightsModel: Codable, Hashable {
    let offers: [Offer]
}

struct Offer: Codable, Hashable {
    let id: Int
    let title: String
    let town: String
    let price: Price
}

struct Price: Codable, Hashable {
    let value: Int
}
