import SwiftUI

struct StubView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let mediumFont = "SFProDisplay-Medium"
        static let semiboldFont = "SFProDisplay-Semibold"
        static let fontSize: CGFloat = 22
        static let buttonFontSize: CGFloat = 16
    }
    
    
    // MARK: - Properties
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Text("В разработке...")
                    .foregroundStyle(.white)
                    .font(.custom(Constants.semiboldFont, size: Constants.fontSize))
                
                Spacer()
            }
        }
        .toolbarRole(.editor)
    }
    
}

#Preview {
    StubView()
}
