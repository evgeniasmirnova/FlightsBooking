import SwiftUI

struct SearchView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let backgroundColor = Color(red: 0.141, green: 0.145, blue: 0.161)
        static let blueColor = Color(red: 0.298, green: 0.584, blue: 0.996)
        static let darkBlueColor = Color(red: 0, green: 0.259, blue: 0.49)
        static let greenColor = Color(red: 0.227, green: 0.388, blue: 0.231)
        static let rectangleColor = Color(red: 0.369, green: 0.373, blue: 0.38)
        static let redColor = Color(red: 1, green: 0, blue: 0)
        static let routeText = "Сложный маршрут"
        static let anywhereText = "Куда угодно"
        static let dayOffText = "Выходные"
        static let ticketsText = "Горячие билеты"
        static let routeIcon = "command"
        static let globeIcon = "globe"
        static let calendarIcon = "calendar"
        static let flameIcon = "flame"
        static let spacing: CGFloat = 30
        static let cornerRadius: CGFloat = 10
        static let rectangleHeight: CGFloat = 5
        static let rectangleWidth: CGFloat = 38
        static let topPadding: CGFloat = 20
    }
    
    
    // MARK: - Properties
    
    @EnvironmentObject private var coordinator: SearchCoordinator
    @ObservedObject var viewModel = SearchViewModel()
    @State var arrivalWasChoosen = false
    @State var toText = String()
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Constants.backgroundColor.ignoresSafeArea()
            
            VStack(spacing: Constants.spacing) {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .frame(width: Constants.rectangleWidth, height: Constants.rectangleHeight)
                    .padding(.top, Constants.topPadding)
                    .foregroundStyle(Constants.rectangleColor)
                
                DestinationView(toText: $toText, departureCityName: viewModel.departureCityName)
                
                ClueIconsView(toText: $toText, coordinator: coordinator)
                
                RecommendationsView(toText: $toText, arrivalWasChoosen: $arrivalWasChoosen)
                
                Spacer()
            }
            .overlay {
                if arrivalWasChoosen {
                    DestinationChosenView(toText: toText, arrivalWasChoosen: $arrivalWasChoosen)
                }
            }
            
        }
    }
    
}

#Preview {
    SearchView()
        .environmentObject(SearchCoordinator())
}





