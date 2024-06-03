import SwiftUI
import OrderedCollections

struct RecommendationsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let rectangleColor = Color(red: 0.184, green: 0.188, blue: 0.208)
        static let textColor = Color(red: 0.369, green: 0.373, blue: 0.38)
        static let mediumFontSize: CGFloat = 16
        static let regularFontSize: CGFloat = 14
        static let popularText = "Популярное направление"
        static let dataDictionary: OrderedDictionary = ["Стамбул": "stambul", "Сочи": "sochi", "Пхукет": "phuket"]
        static let cornerRadius: CGFloat = 16
        static let imageCornerRadius: CGFloat = 8
        static let rectangleHeight: CGFloat = 200
        static let horizontalPadding: CGFloat = 16
        static let imageSize: CGFloat = 40
        static let smallSpacing: CGFloat = 4
        static let dividerWidth: CGFloat = 330
        static let dividerHeight: CGFloat = 4
        static let bottomPadding: CGFloat = 10
        static let leadingPadding: CGFloat = 32
    }
    
    
    // MARK: - Properties
    
    @Binding var toText: String
    @Binding var arrivalWasChoosen: Bool
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            // Фон
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.horizontalPadding)
                .foregroundStyle(Constants.rectangleColor)
            
            // Список популярных направлений
            
            VStack {
                ForEach(Constants.dataDictionary.elements, id: \.key) { country, image in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(image)
                                .resizable()
                                .frame(width: Constants.imageSize, height: Constants.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: Constants.imageCornerRadius))
                            VStack(alignment: .leading, spacing: Constants.smallSpacing) {
                                Text(country)
                                    .foregroundStyle(.white)
                                    .font(.custom(Constants.mediumFont, size: Constants.mediumFontSize))
                                Text(Constants.popularText)
                                    .foregroundStyle(Constants.textColor)
                                    .font(.custom(Constants.regularFont, size: Constants.regularFontSize))
                            }
                        }
                        Divider()
                            .overlay(Constants.textColor)
                            .padding(.bottom, Constants.bottomPadding)
                            .frame(width: Constants.dividerWidth, height: Constants.dividerHeight)
                    }
                    .onTapGesture(perform: {
                        toText = country
                        arrivalWasChoosen = true
                    })
                }
            }
            .padding(.leading, Constants.leadingPadding)
            
        }
    }
    
}

#Preview {
    RecommendationsView(toText: .constant(""), arrivalWasChoosen: .constant(false))
}
