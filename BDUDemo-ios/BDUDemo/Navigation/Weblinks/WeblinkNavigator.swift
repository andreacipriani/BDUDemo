import Foundation
import UIKit
import SafariServices

final class WeblinkNavigator {
    func navigate(to urlString: String?, from viewController: UIViewController) -> Bool {
        guard let urlString = urlString, let url = NSURL(string: urlString) else { return false }
        let safariViewController = SFSafariViewController(url: url as URL)
        viewController.present(safariViewController, animated: true, completion: nil)
        return true
    }
}
