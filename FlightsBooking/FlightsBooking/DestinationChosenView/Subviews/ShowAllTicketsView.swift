import SwiftUI

struct ShowAllTicketsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let blueColor = Color(red: 0.133, green: 0.38, blue: 0.737)
        static let text = "Посмотреть все билеты"
        static let fontSize: CGFloat = 16
        static let cornerRadius: CGFloat = 8
        static let rectangleHeight: CGFloat = 42
        static let padding: CGFloat = 16
    }
    
    
    // MARK: - Properties
    
    var coordinator: SearchCoordinator
    var departureText: String
    var destinationText: String
    var departureDate: Date
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.padding)
                .foregroundStyle(Constants.blueColor)
            Button(action: {
                coordinator.push(page: .tickets(destinatonText: destinationText,
                                                departureDate: departureDate))
            }, label: {
                Text(Constants.text)
                    .font(.custom(Constants.regularFont, size: Constants.fontSize))
                    .foregroundStyle(.white)
            })
        }
    }
    
}

#Preview {
    ShowAllTicketsView(coordinator: SearchCoordinator(),
                       departureText: "",
                       destinationText: "",
                       departureDate: Date())
}
