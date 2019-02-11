import Foundation
import UIKit

struct NewsDeeplink {
    let urlString: String
    
    func newsId() -> String? {
        guard isValid() else { return nil }
        let components = urlString.components(separatedBy: ":")
        return components[2]
    }
    
    private func isValid() -> Bool {
        let components = urlString.components(separatedBy: ":")
        guard components.count == 3 else { return false }
        let app = components[0]
        let namespace = components[1]
        return app == "newsfeed" && namespace == "news"
    }
}

protocol NewsDeeplinkNavigating {
    func navigate(to deeplink: NewsDeeplink, from viewController: UIViewController)
}

final class NewsDeeplinkNavigator {
    func navigate(to deeplink: NewsDeeplink, from viewController: UIViewController) {
        guard let navigationController = viewController.navigationController, let newsId = deeplink.newsId() else { return }
        let newsDetailViewController = NewsDetailViewController(newsId: newsId)
        navigationController.pushViewController(newsDetailViewController, animated: true)
    }
}
