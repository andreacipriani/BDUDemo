import Foundation
import UIKit

struct NewsViewModel {
    let title: String
    let category: String
    let image: UIImage
}

extension NewsViewModel {
    static func from(_ newsItem: NewsItem) -> NewsViewModel {
        let image = UIImage(named: newsItem.imageName) ?? UIImage()
        return NewsViewModel(title: newsItem.title, category: newsItem.category.uppercased(), image: image)
    }
}
