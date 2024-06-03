import SwiftUI

struct NavigationBarView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let backgroundColor = Color(red: 0.141, green: 0.145, blue: 0.161)
        static let dateTextColor = Color(red: 0.624, green: 0.624, blue: 0.624)
        static let blueColor = Color(red: 0.133, green: 0.38, blue: 0.737)
        static let mediumFont = "SFProDisplay-Medium"
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFontSize: CGFloat = 16
        static let regularFontSize: CGFloat = 14
        static let backIcon = "arrow.backward"
        static let horizontalPadding: CGFloat = 16
        static let frameHeight: CGFloat = 52
        static let spacing: CGFloat = 4
    }
    
    
    // MARK: - Properties
    
    @Environment(\.dismiss) private var dismiss
    var coordinator: SearchCoordinator
    var departureText: String
    var destinationText: String
    var departureDate: Date
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            Constants.backgroundColor
                .frame(width: UIScreen.main.bounds.width - Constants.horizontalPadding,
                       height: Constants.frameHeight)
            HStack {
                Button(action: {
                    coordinator.pop()
                }, label: {
                    Image(systemName: Constants.backIcon)
                        .font(.system(size: Constants.regularFontSize))
                        .foregroundStyle(Constants.blueColor)
                })
                .padding(.leading, Constants.horizontalPadding)
                VStack(alignment: .leading, spacing: Constants.spacing) {
                    Text(departureText + " — " + destinationText)
                        .foregroundStyle(.white)
                        .font(.custom(Constants.mediumFont, size: Constants.mediumFontSize))
                    Text(departureDate.getFormattedDate(template: "d MMM") + ", 1 пассажир")
                        .foregroundStyle(Constants.dateTextColor)
                        .font(.custom(Constants.regularFont, size: Constants.regularFontSize))
                }
            }
        }
    }
    
}

#Preview {
    NavigationBarView(coordinator: SearchCoordinator(),
                      departureText: "",
                      destinationText: "",
                      departureDate: Date())
}
