import Foundation
import UIKit

struct NewsViewModel {
    let title: String
    let category: String
    let author: String
    let image: UIImage
    let style: NewsItemStyle
}

extension NewsViewModel {
    static func from(_ newsItem: NewsItem) -> NewsViewModel {
        let image = UIImage(named: newsItem.imageName) ?? UIImage()
        return NewsViewModel(title: newsItem.title,
                             category: newsItem.category.uppercased(),
                             author: newsItem.authorName,
                             image: image,
                             style: newsItem.style)
    }
}
