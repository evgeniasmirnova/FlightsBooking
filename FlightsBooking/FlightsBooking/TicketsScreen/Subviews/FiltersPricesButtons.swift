import SwiftUI

struct FiltersPricesButtons: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let blueColor = Color(red: 0.133, green: 0.38, blue: 0.737)
        static let filtersText = "Фильтр"
        static let pricesText = "График цен"
        static let filterIcon = "slider.horizontal.3"
        static let chartIcon = "chart.bar.xaxis"
        static let fontSize: CGFloat = 14
        static let cornerRadius: CGFloat = 50
        static let spacing: CGFloat = 16
        static let padding: CGFloat = 8
        static let iconFrame: CGFloat = 16
    }
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(spacing: Constants.spacing) {
            
            // Кнопка "Фильтр"
            
            Button(action: {}, label: {
                HStack {
                    Image(systemName: Constants.filterIcon)
                    Text(Constants.filtersText)
                }
                .foregroundStyle(.white)
                .font(.custom(Constants.regularFont, size: Constants.fontSize))
            })
            
            // Кнопка "График цен"
            
            Button(action: {}, label: {
                HStack {
                    Image(.chartIcon)
                        .resizable()
                        .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    Text(Constants.pricesText)
                }
                .foregroundStyle(.white)
                .font(.custom(Constants.regularFont, size: Constants.fontSize))
            })
        }
        .padding(.all, Constants.padding)
        .background(Constants.blueColor, in: RoundedRectangle(cornerRadius: Constants.cornerRadius))
    }
    
}

#Preview {
    FiltersPricesButtons()
}
