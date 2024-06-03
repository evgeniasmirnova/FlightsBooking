import SwiftUI

struct TabBarView: View {
    
    // MARK: - Constants
    
    struct Constants {
        static let planeText = "Авиабилеты"
        static let hotelsText = "Отели"
        static let mapText = "Короче"
        static let subsText = "Подписки"
        static let profileText = "Профиль"
    }
    
    
    // MARK: - Body
    
    var body: some View {
        TabView {
            BaseCoordinatorView()
                .tabItem {
                    Label(Constants.planeText, image: .planeIcon)
                        .foregroundStyle(.blue)
                }
            StubView()
                .tabItem {
                    Label(Constants.hotelsText, image: .hotelIcon)
                }
            StubView()
                .tabItem {
                    Label(Constants.mapText, image: .mapIcon)
                }
            StubView()
                .tabItem {
                    Label(Constants.subsText, image: .subsIcon)
                }
            StubView()
                .tabItem {
                    Label(Constants.profileText, image: .profileIcon)
                }
        }
    }
    
}

#Preview {
    TabBarView()
}
