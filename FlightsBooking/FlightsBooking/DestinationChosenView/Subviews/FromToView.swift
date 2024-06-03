import SwiftUI

struct FromToView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let rectangleColor = Color(red: 0.184, green: 0.188, blue: 0.208)
        static let dividerColor = Color(red: 0.243, green: 0.247, blue: 0.263)
        static let xmarkIcon = "xmark"
        static let reverseIcon = "arrow.up.arrow.down"
        static let backArrowIcon = "arrow.backward"
        static let dividerWidth: CGFloat = 296
        static let regularFontSize: CGFloat = 16
        static let iconSize: CGFloat = 12
        static let cornerRadius: CGFloat = 16
        static let spacing: CGFloat = 14
        static let rectangleHeight: CGFloat = 96
        static let horizontalPadding: CGFloat = 16
        static let largePadding: CGFloat = 32
    }
    
    
    // MARK: - Properties
    
    var coordinator: SearchCoordinator
    @Binding var fromText: String
    @Binding var toText: String
    @Binding var arrivalWasChoosen: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Фон
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.horizontalPadding)
                .foregroundStyle(Constants.rectangleColor)
            
            // Поля отображения направлений
            
            HStack(alignment: .center, spacing: Constants.spacing) {
                Button(action: {
                    arrivalWasChoosen = false
                }, label: {
                    Image(systemName: Constants.backArrowIcon)
                        .font(.custom(Constants.regularFont, size: Constants.regularFontSize))
                        .foregroundStyle(.white)
                })
                
                VStack(alignment: .center) {
                    HStack {
                        Text(fromText)
                            .font(.custom(Constants.regularFont, size: Constants.regularFontSize))
                            .foregroundStyle(.white)
                        Spacer()
                        Button(action: {
                            let tempText = fromText
                            fromText = toText
                            toText = tempText
                        }, label: {
                            Image(systemName: Constants.reverseIcon)
                                .foregroundStyle(.white)
                                .font(.system(size: Constants.iconSize))
                        })
                    }
                    
                    Divider()
                        .overlay(Constants.dividerColor)
                        .frame(width: Constants.dividerWidth)
                    
                    HStack {
                        Text(toText)
                            .font(.custom(Constants.regularFont, size: Constants.regularFontSize))
                            .foregroundStyle(.white)
                        Spacer()
                        Button(action: {
                            toText = String()
                        }, label: {
                            Image(systemName: Constants.xmarkIcon)
                                .foregroundStyle(.white)
                                .font(.system(size: Constants.iconSize))
                        })
                    }
                }
                
            }
            .padding(.horizontal, Constants.largePadding)
        }
        
    }
    
}

#Preview {
    FromToView(coordinator: SearchCoordinator(), 
               fromText: .constant(""),
               toText: .constant(""),
               arrivalWasChoosen: .constant(false))
}
