import Foundation
import UIKit

struct ViewControllerFactory {
    func makeViewController(from navigationLink: NavigationLink) -> UIViewController? {
        guard let navigationPage = navigationLink.navigationPage, let id = navigationLink.id else { return nil }
        switch navigationPage {
        case .ad:
            return AdViewController(newsId: id)
        case .newsDetail:
            return NewsDetailViewController(newsId: id)
        }
    }
}
