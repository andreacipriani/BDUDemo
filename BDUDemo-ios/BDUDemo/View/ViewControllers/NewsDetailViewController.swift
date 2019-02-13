import UIKit

final class NewsDetailViewController: UIViewController {    
    private (set) var newsId: String!

    convenience init(newsId: String) {
        self.init()
        self.newsId = newsId
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let newsId = newsId {
            title = "News \(newsId)"
        }
    }
}
