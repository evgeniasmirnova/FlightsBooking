import SwiftUI

enum SearchPage: Hashable, Identifiable {
    case search, stub
    case tickets(destinatonText: String, departureDate: Date)
    
    var id: String {
        switch self {
        case .search:
            return "Search"
        case .stub:
            return "Stub"
        case .tickets(destinatonText: let destinatonText, departureDate: let departureDate):
            return "Tickets"
        }
    }
}

class SearchCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var path = NavigationPath()
    
    
    // MARK: - Methods
    
    func push(page: SearchPage) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    // MARK: - ViewBuilder methods
    
    @ViewBuilder
    func build(page: SearchPage) -> some View {
        switch page {
        case .search:
            SearchView()
        case .tickets(let destinationText, let departureDate):
            TicketsView(destinationText: destinationText, departureDate: departureDate)
        case .stub:
            StubView()
        }
    }
    
}
