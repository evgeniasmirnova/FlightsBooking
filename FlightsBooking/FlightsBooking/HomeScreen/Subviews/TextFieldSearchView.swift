import SwiftUI

struct TextFieldSearchView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let regularFont = "SFProDisplay-Regular"
        static let largeRectangleForegroundColor = Color(red: 0.184, green: 0.188, blue: 0.208)
        static let smallRectangleForegroundColor = Color(red: 0.243, green: 0.247, blue: 0.263)
        static let placeholderColor = Color(red: 0.624, green: 0.624, blue: 0.624)
        static let magnifyingGlassIcon = "magnifyingglass"
        static let fromPlaceholder = "Откуда - Москва"
        static let toPlaceholder = "Куда - Турция"
        static let cornerRadius: CGFloat = 16
        static let fontSize: CGFloat = 16
        static let largeRectangleHeight: CGFloat = 122
        static let smallRectangleWidth: CGFloat = 296
        static let smallRectangleHeight: CGFloat = 90
        static let dividerWidth: CGFloat = 232
        static let regularPadding: CGFloat = 16
        static let mediumPadding: CGFloat = 32
        static let spacing: CGFloat = 14
    }
    
    
    // MARK: - Properties
    
    @State var isPresented = false
    @Binding var fromText: String
    @Binding var toText: String
    var coordinator: BaseCoordinator
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {

            // Фон
            
            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.largeRectangleHeight)
                .padding(.horizontal, Constants.regularPadding)
                .foregroundStyle(Constants.largeRectangleForegroundColor)

            RoundedRectangle(cornerRadius: Constants.cornerRadius)
                .frame(height: Constants.smallRectangleHeight)
                .padding(.horizontal, Constants.mediumPadding)
                .foregroundStyle(Constants.smallRectangleForegroundColor)
            
            // Поля для ввода направлений
            
            HStack(alignment: .center, spacing: Constants.spacing) {
                Image(systemName: Constants.magnifyingGlassIcon)
                    .foregroundStyle(.gray)
                
                VStack(alignment: .leading) {
                    
                    TextField("", text: $fromText, prompt: Text(Constants.fromPlaceholder)
                        .foregroundStyle(Constants.placeholderColor)
                        .font(.custom(Constants.regularFont, size: Constants.fontSize)))
                    
                    Divider()
                        .overlay(.white)
                        .frame(width: Constants.dividerWidth)
                    
                    Button(action: {
                        coordinator.present(sheet: .search)
                    }, label: {
                        Text(Constants.toPlaceholder)
                            .foregroundStyle(Constants.placeholderColor)
                            .font(.custom(Constants.regularFont, size: Constants.fontSize))
                    })
                    .buttonStyle(.plain)
                    
                }
                .font(.custom(Constants.regularFont, size: Constants.fontSize))
                .foregroundStyle(.white)
                
            }
            .padding(.all, Constants.regularPadding)
            .frame(width: Constants.smallRectangleWidth, height: Constants.smallRectangleHeight)
        }
        .padding(.top, Constants.regularPadding)
    }
}

#Preview {
    TextFieldSearchView(fromText: .constant(""), toText: .constant(""), coordinator: BaseCoordinator())
}
