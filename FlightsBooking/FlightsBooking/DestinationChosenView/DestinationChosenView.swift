import SwiftUI

struct DestinationChosenView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 40
    }
    
    
    // MARK: - Properties
    
    @EnvironmentObject private var coordinator: SearchCoordinator
    @ObservedObject var viewModel = DestinationChosenViewModel()
    @State var toText: String
    @Binding var arrivalWasChoosen: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: Constants.spacing) {
                FromToView(coordinator: coordinator, 
                           fromText: $viewModel.departureCityName,
                           toText: $toText, 
                           arrivalWasChoosen: $arrivalWasChoosen)
                WidgetsView(viewModel: viewModel)
                OffersView(viewModel: viewModel)
                ShowAllTicketsView(coordinator: coordinator,
                                   departureText: viewModel.departureCityName,
                                   destinationText: toText,
                                   departureDate: viewModel.departureDate)
                SubsriptionView()
                Spacer()
            }
            .padding(.top, Constants.padding)
        }
    }
}

#Preview {
    DestinationChosenView(toText: "Сочи", arrivalWasChoosen: .constant(false))
        .environmentObject(SearchCoordinator())
}
