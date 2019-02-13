import Foundation
import UIKit

protocol DeeplinkNavigating {
    func navigate(to navigationLink: NavigationLink, from viewController: UIViewController)
}

final class DeeplinkNavigator {
    private let viewControllerFactory: ViewControllerFactory
    
    init(viewControllerFactory: ViewControllerFactory = ViewControllerFactory()) {
        self.viewControllerFactory = viewControllerFactory
    }
    
    func navigate(to navigationLink: NavigationLink, from viewController: UIViewController) -> Bool {
        guard let navigationController = viewController.navigationController, let viewController = viewControllerFactory.makeViewController(from: navigationLink) else { return false }
        navigationController.pushViewController(viewController, animated: true)
        return true
    }
}
