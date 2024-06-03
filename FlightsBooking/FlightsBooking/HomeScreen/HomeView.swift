import SwiftUI

struct HomeView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let titleForegroundColor = Color(red: 0.851, green: 0.851, blue: 0.851)
        static let titleText = "Поиск дешевых авиабилетов"
        static let titleFontSize: CGFloat = 22
        static let titleLineLimit: Int = 2
        static let titleWidth: CGFloat = 172
        static let titleHeight: CGFloat = 54
    }
    
    
    // MARK: - Properties
    
    
    @EnvironmentObject private var coordinator: BaseCoordinator
    @ObservedObject var viewModel = HomeViewModel()
    @State private var toText = ""
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                
                Text(Constants.titleText)
                    .frame(width: Constants.titleWidth, height: Constants.titleHeight)
                    .font(.custom(Constants.semiboldFont, size: Constants.titleFontSize))
                    .foregroundStyle(Constants.titleForegroundColor)
                    .lineLimit(Constants.titleLineLimit)
                    .multilineTextAlignment(.center)
                
                TextFieldSearchView(fromText: $viewModel.departureCityName, toText: $toText, coordinator: coordinator)
                    .onChange(of: viewModel.departureCityName) { _, _ in
                        viewModel.departureCityNameWasChanged()
                    }
                
                MusicFlightsView(viewModel: viewModel)
                
                Spacer()
            }
        }
    }
    
}

#Preview {
    HomeView()
        .environmentObject(BaseCoordinator())
}



