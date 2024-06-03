import SwiftUI

struct ClueIconsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let fontSize: CGFloat = 14
        static let blueColor = Color(red: 0.298, green: 0.584, blue: 0.996)
        static let darkBlueColor = Color(red: 0, green: 0.259, blue: 0.49)
        static let greenColor = Color(red: 0.227, green: 0.388, blue: 0.231)
        static let redColor = Color(red: 1, green: 0, blue: 0)
        static let routeText = "Сложный маршрут"
        static let anywhereText = "Куда угодно"
        static let dayOffText = "Выходные"
        static let ticketsText = "Горячие билеты"
        static let globeIcon = "globe"
        static let spacing: CGFloat = 24
        static let cornerRadius: CGFloat = 8
        static let rectangleFrame: CGFloat = 48
        static let iconFrame: CGFloat = 24
        static let textWidth: CGFloat = 70
        static let largeTextWidth: CGFloat = 79
        static let lineLimitTwo: Int = 2
        static let lineLimitOne: Int = 1
        static let topPadding: CGFloat = 4
    }
    
    
    // MARK: - Properties
    
    @Binding var toText: String
    var coordinator: SearchCoordinator
    
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .top, spacing: Constants.spacing) {
            
            // Кнопка виджета "Сложный маршрут"
            
            Button(action: {
                coordinator.push(page: .stub)
            } , label: {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .frame(width: Constants.rectangleFrame, height: Constants.rectangleFrame)
                            .foregroundStyle(Constants.greenColor)
                        Image(.commandIcon)
                            .resizable()
                            .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    }
                    Text(Constants.routeText)
                        .frame(width: Constants.textWidth)
                        .lineLimit(Constants.lineLimitTwo)
                        .padding(.top, Constants.topPadding)
                }
            })
            
            // Кнопка виджета "Куда угодно"
            
            Button(action: {
                toText = Constants.anywhereText
            }, label: {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .frame(width: Constants.rectangleFrame, height: Constants.rectangleFrame)
                            .foregroundStyle(Constants.blueColor)
                        Image(systemName: Constants.globeIcon)
                            .resizable()
                            .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                            .foregroundStyle(.white)
                    }
                    Text(Constants.anywhereText)
                        .frame(width: Constants.largeTextWidth)
                        .lineLimit(Constants.lineLimitOne)
                        .padding(.top, Constants.topPadding)
                }
            })
            
            // Кнопка виджета "Выходные"
            
            Button(action: {
                coordinator.push(page: .stub)
            } , label: {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .frame(width: Constants.rectangleFrame, height: Constants.rectangleFrame)
                            .foregroundStyle(Constants.darkBlueColor)
                        Image(.calendarIcon)
                            .resizable()
                            .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    }
                    Text(Constants.dayOffText)
                        .frame(width: Constants.textWidth)
                        .lineLimit(Constants.lineLimitOne)
                        .padding(.top, Constants.topPadding)
                }
            })
            
            // Кнопка виджета "Горячие билеты"
            
            Button(action: {
                coordinator.push(page: .stub)
            } , label: {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .frame(width: Constants.rectangleFrame, height: Constants.rectangleFrame)
                            .foregroundStyle(Constants.redColor)
                        Image(.flameIcon)
                            .resizable()
                            .frame(width: Constants.iconFrame, height: Constants.iconFrame)
                    }
                    Text(Constants.ticketsText)
                        .frame(width: Constants.textWidth)
                        .lineLimit(Constants.lineLimitTwo)
                        .padding(.top, Constants.topPadding)
                }
            })
        }
        .foregroundStyle(.white)
        .font(.custom(Constants.regularFont, size: Constants.fontSize))
        .multilineTextAlignment(.center)
    }
}


#Preview {
    ClueIconsView(toText: .constant(""), coordinator: SearchCoordinator())
}
