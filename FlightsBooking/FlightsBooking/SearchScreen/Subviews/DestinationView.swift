import SwiftUI

struct DestinationView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let rectangleForegroundColor = Color(red: 0.184, green: 0.188, blue: 0.208)
        static let grayColor = Color(red: 0.624, green: 0.624, blue: 0.624)
        static let closeIcon = "xmark"
        static let toPlaceholder = "Куда - Турция"
        static let cornerRadius: CGFloat = 16
        static let fontSize: CGFloat = 16
        static let smallerFontSize: CGFloat = 14
        static let rectangleHeight: CGFloat = 96
        static let rectangleWidth: CGFloat = 328
        static let dividerWidth: CGFloat = 296
        static let regularPadding: CGFloat = 16
        static let mediumPadding: CGFloat = 32
        static let spacing: CGFloat = 14
        static let horizontalPadding: CGFloat = 4
        static let topPadding: CGFloat = 2
        static let iconFrame: CGFloat = 24
    }
    
    
    // MARK: - Properties
    
    @Binding var toText: String
    var departureCityName: String
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // Фон
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.regularPadding)
                .foregroundStyle(Constants.rectangleForegroundColor)
            
            // Поле для выбора направления
            
            VStack(alignment: .leading) {
                Label(
                    title: {
                        Text(departureCityName)
                            .foregroundStyle(.white)
                            .font(.custom(Constants.regularFont, size: Constants.fontSize))
                            .padding(.leading, Constants.horizontalPadding)
                    },
                    icon: {
                        Image(.flyingPlaneIcon)
                            .resizable()
                            .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    }
                )
                
                Divider()
                    .overlay(.white)
                    .frame(width: Constants.dividerWidth)
                
                HStack(alignment: .center) {
                    Image(.glassIcon)
                        .resizable()
                        .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    TextField(String(), text: $toText, prompt: Text(Constants.toPlaceholder)
                        .foregroundStyle(Constants.grayColor)
                        .font(.custom(Constants.regularFont, size: Constants.fontSize)))
                    .padding(.leading, Constants.horizontalPadding)
                    Spacer()
                    Image(systemName: Constants.closeIcon)
                        .foregroundStyle(.white)
                        .font(.system(size: Constants.smallerFontSize))
                        .padding(.trailing, Constants.horizontalPadding)
                        .onTapGesture {
                            toText = String()
                        }
                }
                .padding(.top, Constants.topPadding)
                
            }
            .padding(.all, Constants.regularPadding)
            .frame(width: Constants.rectangleWidth, height: Constants.rectangleHeight)
            .font(.custom(Constants.regularFont, size: Constants.fontSize))
            .foregroundStyle(.white)
    
        }
    }
    
}

#Preview {
    DestinationView(toText: .constant(""), departureCityName: "")
}
