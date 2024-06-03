import SwiftUI

struct SubsriptionView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let semiboldFont = "SFProDisplay-Semibold"
        static let rectangleColor = Color(red: 0.141, green: 0.145, blue: 0.161)
        static let blueColor = Color(red: 0.133, green: 0.38, blue: 0.737)
        static let cornerRadius: CGFloat = 8
        static let rectangleHeight: CGFloat = 51
        static let subscriptionText = "Подписка на цену"
        static let bellIcon = "bell.fill"
        static let fontSize: CGFloat = 16
        static let regularPadding: CGFloat = 16
        static let largePadding: CGFloat = 32
        static let scaleEffect: CGFloat = 0.8
    }
    
    
    // MARK: - Properties
    
    @State private var isToggleOn = false
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.regularPadding)
                .foregroundStyle(Constants.rectangleColor)
            HStack {
                Image(systemName: Constants.bellIcon)
                    .foregroundStyle(Constants.blueColor)
                Text(Constants.subscriptionText)
                    .font(.custom(Constants.semiboldFont, size: Constants.fontSize))
                    .foregroundStyle(.white)
                Toggle(String(), isOn: $isToggleOn)
                    .toggleStyle(.switch)
                    .scaleEffect(CGSize(width: Constants.scaleEffect, height: Constants.scaleEffect))
            }
            .padding(EdgeInsets(top: .zero,
                                leading: Constants.largePadding,
                                bottom: .zero,
                                trailing: Constants.regularPadding))
        }
    }
    
}

#Preview {
    SubsriptionView()
}
