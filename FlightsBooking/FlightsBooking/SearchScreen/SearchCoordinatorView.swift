import SwiftUI

struct SearchCoordinatorView: View {
    
    @StateObject private var coordinator = SearchCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .search)
                .navigationDestination(for: SearchPage.self) { page in
                    coordinator.build(page: page)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    BaseCoordinatorView()
}
