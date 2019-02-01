import Foundation
import UIKit

struct NewsViewModel {
    let title: String
    let category: String
    let author: String
    let image: UIImage
    let style: NewsItemStyle
    let ad: NewsAdViewModel?
}

struct NewsAdViewModel {
    let title: String
    let callToAction: String
    let image: UIImage?

    static func from(_ ad: NewsAd?) -> NewsAdViewModel? {
        guard let ad = ad else { return nil }
        return NewsAdViewModel(title: ad.title, callToAction: ad.callToAction, image: UIImage(named: ad.imageName) ?? nil)
    }
}

extension NewsViewModel {
    static func from(_ newsItem: NewsItem) -> NewsViewModel {
        let image = UIImage(named: newsItem.imageName) ?? UIImage()
        return NewsViewModel(title: newsItem.title,
                             category: newsItem.category.uppercased(),
                             author: newsItem.authorName,
                             image: image,
                             style: newsItem.style,
                             ad: NewsAdViewModel.from(newsItem.ad))
    }
}
