import Foundation
import UIKit

final class Navigator {
    private let deeplinkNavigator: DeeplinkNavigator
    private let weblinkNavigator: WeblinkNavigator
    
    init(deeplinkNavigator: DeeplinkNavigator = DeeplinkNavigator(),
         weblinkNavigator: WeblinkNavigator = WeblinkNavigator()) {
        self.deeplinkNavigator = deeplinkNavigator
        self.weblinkNavigator = weblinkNavigator
    }
    
    func navigate(to navigationLink: NavigationLink?, fallbackUrlString: String?, from viewController: UIViewController) {
        var didNavigate = false
        if let navigationLink = navigationLink, navigationLink.isValid() {
           didNavigate = deeplinkNavigator.navigate(to: navigationLink, from: viewController)
        }
        if !didNavigate {
            _ = weblinkNavigator.navigate(to: fallbackUrlString, from: viewController)
        }
    }
}
