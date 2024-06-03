import SwiftUI

struct BaseCoordinatorView: View {
    
    // MARK: - Properties
    
    @StateObject private var coordinator = BaseCoordinator()
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(page: .home)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page: page)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(sheet: sheet)
                }
        }
        .environmentObject(coordinator)
    }
}

#Preview {
    BaseCoordinatorView()
}
