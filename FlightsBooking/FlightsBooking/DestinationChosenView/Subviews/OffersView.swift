import SwiftUI

struct OffersView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let rectangleColor = Color(red: 0.114, green: 0.118, blue: 0.125)
        static let blueColor = Color(red: 0.133, green: 0.38, blue: 0.737)
        static let dividerColor = Color(red: 0.369, green: 0.373, blue: 0.38)
        static let cornerRadius: CGFloat = 16
        static let rectangleHeight: CGFloat = 270
        static let titleText = "Прямые рельсы"
        static let titleFontSize: CGFloat = 20
        static let offerFontSize: CGFloat = 14
        static let circleFrame: CGFloat = 24
        static let lineLimit: Int = 1
        static let bottomPadding: CGFloat = 1
        static let leadingPadding: CGFloat = 32
        static let verticalPadding: CGFloat = 6
        static let horizontalPadding: CGFloat = 16
    }
    
    
    // MARK: - Properties
    
    var viewModel: DestinationChosenViewModel
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            // Фон
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .foregroundStyle(Constants.rectangleColor)
            
            // Список рейсов
            
            VStack(alignment: .leading) {
                Text(Constants.titleText)
                    .font(.custom(Constants.semiboldFont, size: Constants.titleFontSize))
                
                ForEach(viewModel.offersData, id: \.id) { offer in
                    HStack(alignment: .top) {
                        Circle()
                            .frame(width: Constants.circleFrame, height: Constants.circleFrame)
                            .foregroundStyle(viewModel.getColor(model: offer))
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(offer.title)
                                Spacer()
                                Text("\(offer.price.value) ₽ >")
                                    .foregroundStyle(Constants.blueColor)
                            }
                            .padding(.bottom, Constants.bottomPadding)
                            
                            Text(viewModel.getTimesString(model: offer))
                                .lineLimit(Constants.lineLimit)
                            
                            Divider()
                                .overlay(Constants.dividerColor)
                                .padding(.leading, -Constants.leadingPadding)
                            
                        }
                        .font(.custom(Constants.regularFont, size: Constants.offerFontSize))
                    }
                }
                .padding(.vertical, Constants.verticalPadding)
            }
            .padding(.horizontal, Constants.horizontalPadding)
            .foregroundStyle(.white)
        }
        .padding(.horizontal, Constants.horizontalPadding)
    }
    
}

#Preview {
   OffersView(viewModel: DestinationChosenViewModel())
}
