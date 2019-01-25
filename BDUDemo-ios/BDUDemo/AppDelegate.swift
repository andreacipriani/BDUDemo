import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        showWindowWithFirstViewController()
        return true
    }
    
    // MARK: - Private
    
    private func showWindowWithFirstViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = NewsViewController(presenter: NewsPresenter())
        window?.makeKeyAndVisible()
    }
}
