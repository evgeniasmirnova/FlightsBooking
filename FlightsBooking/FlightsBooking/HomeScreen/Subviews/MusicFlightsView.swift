import SwiftUI

struct MusicFlightsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let titleText = "Музыкально отлететь"
        static let titleFontSize: CGFloat = 22
        static let spacing: CGFloat = 16
        static let imageSize: CGFloat = 132
        static let cornerRadius: CGFloat = 16
        static let bottomPadding: CGFloat = 2
        static let regularFontSize: CGFloat = 16
        static let smallFontSize: CGFloat = 14
        static let frameHeight: CGFloat = 213
        static let padding: CGFloat = 16
        static let iconFrame: CGFloat = 24
    }
    
    
    // MARK: - Properties
    
    var viewModel: HomeViewModel
    
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // Заголовок
            
            Text(Constants.titleText)
                .font(.custom(Constants.semiboldFont, size: Constants.titleFontSize))
                .foregroundStyle(.white)
                .padding(.vertical, Constants.padding)
            
            // Список концертов, городов и цен на билеты
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Constants.spacing) {
                    ForEach(viewModel.musicFlightsData, id: \.id) { flight in
                        VStack(alignment: .leading) {
                            Image(viewModel.getImage(model: flight))
                                .resizable()
                                .frame(width: Constants.imageSize, height: Constants.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
                            Text(flight.title)
                                .font(.custom(Constants.mediumFont, size: Constants.regularFontSize))
                                .padding(.bottom, Constants.bottomPadding)
                            Text(flight.town)
                                .font(.custom(Constants.regularFont, size: Constants.smallFontSize))
                                .padding(.bottom, Constants.bottomPadding)
                            HStack {
                                Image(.flyingPlaneIcon)
                                    .resizable()
                                    .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                                Text("От \(flight.price.value) ₽")
                                    .foregroundStyle(.white)
                                    .font(.custom(Constants.regularFont, size: Constants.smallFontSize))
                            }
                        }
                        .foregroundStyle(.white)
                    }
                }
            }
            .frame(height: Constants.frameHeight)
            
        }
        .padding(.horizontal, Constants.padding)
    }
    
}

#Preview {
    MusicFlightsView(viewModel: HomeViewModel())
}
