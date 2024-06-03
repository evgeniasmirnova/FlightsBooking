import SwiftUI

enum Page: String, Identifiable {
    case home
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case search
    
    var id: String {
        self.rawValue
    }
}

class BaseCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    
    
    // MARK: - Methods
    
    func push(page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    
    // MARK: - ViewBuilder methods
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .home:
            HomeView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .search:
            SearchCoordinatorView()
        }
    }
    
}
