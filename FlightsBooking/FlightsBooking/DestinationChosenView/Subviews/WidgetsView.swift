import SwiftUI

struct WidgetsView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let fontSize: CGFloat = 14
        static let vidgetColor = Color(red: 0.184, green: 0.188, blue: 0.208)
        static let backDate = "обратно"
        static let plusIcon = "plus"
        static let personIcon = "person.fill"
        static let passengerInfo = "1, эконом"
        static let filterIcon = "slider.horizontal.3"
        static let verticalPadding: CGFloat = 6
        static let horizontalPadding: CGFloat = 12
        static let cornerRadius: CGFloat = 50
    }
    
    
    // MARK: - Properties
    
    @State private var returnDate = Date()
    @State private var departureDate = Date()
    
    @State private var returnDayWasChoosen: Bool = false
    @State private var departureDayString = String()
    
    var viewModel: DestinationChosenViewModel
    
    
    // MARK: - Body
    
    var body: some View {
        HStack {
            
            // Поле выбора обратной даты
            
            Group {
                if returnDayWasChoosen {
                    Text(viewModel.getFormattedDate(date: returnDate))
                        .foregroundStyle(.white)
                        .font(.custom(Constants.regularFont, size: Constants.fontSize)) +
                    Text(viewModel.getDayOfWeek(date: returnDate))
                        .foregroundStyle(.gray)
                        .font(.custom(Constants.regularFont, size: Constants.fontSize))
                } else {
                    Label(Constants.backDate, systemImage: Constants.plusIcon)
                }
            }.padding(EdgeInsets(top: Constants.verticalPadding,
                                 leading: Constants.horizontalPadding,
                                 bottom: Constants.verticalPadding,
                                 trailing: Constants.horizontalPadding))
            .background(Constants.vidgetColor, in: RoundedRectangle(cornerRadius: Constants.cornerRadius))
            .foregroundStyle(.white)
            .font(.custom(Constants.regularFont, size: Constants.fontSize))
            .lineLimit(1)
            .overlay {
                DatePicker(String(), selection: $returnDate, displayedComponents: .date)
                    .blendMode(.destinationOver)
                    .onChange(of: returnDate) {
                        self.returnDate = returnDate
                        self.returnDayWasChoosen = true
                    }
            }
            
            // Поле даты отправления
            
            Group {
                Text(viewModel.getFormattedDate(date: departureDate))
                    .foregroundStyle(.white)
                    .font(.custom(Constants.regularFont, size: Constants.fontSize)) +
                Text(viewModel.getDayOfWeek(date: departureDate))
                    .foregroundStyle(.gray)
                    .font(.custom(Constants.regularFont, size: Constants.fontSize))
            }
            .padding(EdgeInsets(top: Constants.verticalPadding,
                                leading: Constants.horizontalPadding,
                                bottom: Constants.verticalPadding,
                                trailing: Constants.horizontalPadding))
            .background(Constants.vidgetColor, in: RoundedRectangle(cornerRadius: Constants.cornerRadius))
            .overlay {
                DatePicker(String(), selection: $departureDate, displayedComponents: .date)
                    .blendMode(.destinationOver)
                    .onChange(of: departureDate) {
                        self.departureDate = departureDate
                        self.departureDayString = viewModel.getFormattedDate(date: departureDate)
                    }
            }
            
            // Поле количества человек и класса
            
            HStack {
                Image(systemName: Constants.personIcon)
                Text(Constants.passengerInfo)
            }
            .padding(EdgeInsets(top: Constants.verticalPadding,
                                leading: Constants.horizontalPadding,
                                bottom: Constants.verticalPadding,
                                trailing: Constants.horizontalPadding))
            .background(Constants.vidgetColor, in: RoundedRectangle(cornerRadius: Constants.cornerRadius))
            .foregroundStyle(.white)
            .font(.custom(Constants.regularFont, size: Constants.fontSize))
            
            // Поле фильтров
            
            Image(systemName: Constants.filterIcon)
                .padding(EdgeInsets(top: Constants.verticalPadding,
                                    leading: Constants.horizontalPadding,
                                    bottom: Constants.verticalPadding,
                                    trailing: Constants.horizontalPadding))
                .background(Constants.vidgetColor, in: RoundedRectangle(cornerRadius: Constants.cornerRadius))
                .foregroundStyle(.white)
                .font(.custom(Constants.regularFont, size: Constants.fontSize))
        }
        
    }
    
}

#Preview {
    WidgetsView(viewModel: DestinationChosenViewModel())
}
