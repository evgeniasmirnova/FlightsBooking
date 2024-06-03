import SwiftUI

struct TicketsRowView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let rectangleColor = Color(red: 0.114, green: 0.118, blue: 0.125)
        static let redColor = Color(red: 1, green: 0.369, blue: 0.369)
        static let fontSize: CGFloat = 14
        static let priceFontSize: CGFloat = 22
        static let cornerRadius: CGFloat = 8
        static let spacing: CGFloat = 4
        static let circleFrame: CGFloat = 24
        static let rectangleHeight: CGFloat = 119
        static let horizontalPadding: CGFloat = 8
        static let largeHorizontalPadding: CGFloat = 24
        static let transferTopPadding: CGFloat = 17
        static let transferLeadingPadding: CGFloat = 2
        static let verticalPadding: CGFloat = 4
        static let badgePositionX: CGFloat = 70
        static let badgePositionY: CGFloat = 6
        static let badgeVerticalPadding: CGFloat = 2
        static let badgeHorizontalPadding: CGFloat = 8
        static let badgeCornerRadius: CGFloat = 50
        static let flightTimeStringLeadingMargin: CGFloat = 6
        static let transfer = "/ Без пересадок"
    }
    
    
    // MARK: - Properties
    
    var badge: String?
    var price: Int
    var departureDate: Date
    var arrivalDate: Date
    var departureAirport: String
    var arrivalAirport: String
    var transfer: Bool
    
    
    // MARK: - Init
    
    init(badge: String?,
         price: Int,
         departureDate: String,
         arrivalDate: String,
         departureAirport: String,
         arrivalAirport: String,
         transfer: Bool) {
        self.badge = badge
        self.price = price
        self.departureDate = departureDate.getDateFromString() ?? Date()
        self.arrivalDate = arrivalDate.getDateFromString() ?? Date()
        self.departureAirport = departureAirport
        self.arrivalAirport = arrivalAirport
        self.transfer = transfer
    }
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.rectangleHeight)
                .padding(.horizontal, Constants.horizontalPadding)
                .foregroundStyle(Constants.rectangleColor)
            VStack(alignment: .leading) {
                Text("\(price) ₽")
                    .foregroundStyle(.white)
                    .font(.custom(Constants.semiboldFont, size: Constants.priceFontSize))
                
                HStack(alignment: .center, spacing: Constants.spacing) {
                    Circle()
                        .foregroundStyle(Constants.redColor)
                        .frame(width: Constants.circleFrame, height: Constants.circleFrame)
                        .padding(.trailing, Constants.horizontalPadding)
                    
                    VStack(alignment: .leading) {
                        Text(departureDate.getFormattedDate(template: "HH:mm") + "  — ")
                            .foregroundStyle(.white)
                        Text(departureAirport)
                            .foregroundStyle(.gray)
                    }
                    .font(.custom(Constants.regularFont, size: Constants.fontSize))
                    
                    VStack(alignment: .leading) {
                        Text(arrivalDate.getFormattedDate(template: "HH:mm"))
                            .foregroundStyle(.white)
                        Text(arrivalAirport)
                            .foregroundStyle(.gray)
                    }
                    .font(.custom(Constants.regularFont, size: Constants.fontSize))
                    
                    Text(arrivalDate.getFlightTimeString(with: departureDate))
                        .foregroundStyle(.white)
                        .font(.custom(Constants.regularFont, size: Constants.fontSize))
                        .padding(.top, -Constants.transferTopPadding)
                        .padding(.leading, Constants.flightTimeStringLeadingMargin)
                    
                    if !transfer {
                        Text(Constants.transfer)
                            .foregroundStyle(.white)
                            .font(.custom(Constants.regularFont, size: Constants.fontSize))
                            .padding(.top, -Constants.transferTopPadding)
                            .padding(.leading, Constants.transferLeadingPadding)
                    }
                    
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal, Constants.largeHorizontalPadding)
        }
        .padding(.vertical, Constants.verticalPadding)
        .overlay {
            if let badge {
                Text(badge)
                    .padding(EdgeInsets(top: Constants.verticalPadding,
                                        leading: Constants.horizontalPadding,
                                        bottom: Constants.verticalPadding,
                                        trailing: Constants.horizontalPadding))
                    .background(.blue, in: RoundedRectangle(cornerRadius: Constants.badgeCornerRadius))
                    .position(x: Constants.badgePositionX, y: Constants.badgePositionY)
                    .foregroundStyle(.white)
                    .font(.custom(Constants.regularFont, size: Constants.fontSize))
            }
        }
    }
    
}

#Preview {
    TicketsRowView(badge: nil,
                   price: 0,
                   departureDate: "",
                   arrivalDate: "",
                   departureAirport: "",
                   arrivalAirport: "",
                   transfer: false)
}
