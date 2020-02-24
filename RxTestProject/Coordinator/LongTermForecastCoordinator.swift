
import Foundation
import XCoordinator

enum LongTermForecastRoute: Route {
    case pageOne
}

class LongTermForcastCoordinator: NavigationCoordinator<LongTermForecastRoute> {
    
    init() {
        super.init(initialRoute: .pageOne)
    }
    
    override func prepareTransition(for route:LongTermForecastRoute) -> NavigationTransition {
        switch route {
        case .pageOne:
            let controller = ShortTermForecastViewController()
            return .push(controller)
        }
    }
}
