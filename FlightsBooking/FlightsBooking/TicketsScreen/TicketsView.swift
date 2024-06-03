import SwiftUI

struct TicketsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let rectangleColor = Color(red: 0.114, green: 0.118, blue: 0.125)
        static let padding: CGFloat = 40
        static let buttonPadding: CGFloat = 25
    }
    
    
    // MARK: - Properties
    
    @EnvironmentObject private var coordinator: SearchCoordinator
    @ObservedObject var viewModel = TicketsViewModel()
    
    var destinationText: String
    var departureDate: Date
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(viewModel.ticketsData, id: \.id) { ticket in
                        TicketsRowView(badge: ticket.badge,
                                       price: ticket.price.value,
                                       departureDate: ticket.departure.date,
                                       arrivalDate: ticket.arrival.date,
                                       departureAirport: ticket.departure.airport.rawValue,
                                       arrivalAirport: ticket.arrival.airport.rawValue,
                                       transfer: ticket.hasTransfer)
                    }
                    .padding(.top, Constants.padding)
                }
                
                FiltersPricesButtons()
                    .padding(.top, -Constants.buttonPadding)
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                NavigationBarView(coordinator: coordinator,
                                  departureText: viewModel.departureCityName,
                                  destinationText: destinationText,
                                  departureDate: departureDate)
            }
        }
    }
    
}

#Preview {
    TicketsView(destinationText: "Токио", departureDate: Date())
        .environmentObject(SearchCoordinator())
}





