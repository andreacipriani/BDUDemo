import Foundation
import UIKit

struct NewsViewModel {
    let title: String
    let category: String
    let author: String?
    let image: UIImage
    let style: NewsItemStyle
    let ad: NewsAdViewModel?
    let link: NewsLink?
    
    var desiredHeight: CGFloat {
        return style.desiredHeight
    }
}

struct NewsAdViewModel {
    let title: String
    let callToAction: String
    let image: UIImage?
    let link: NewsLink

    static func from(_ ad: NewsAd?) -> NewsAdViewModel? {
        guard let ad = ad else { return nil }
        return NewsAdViewModel(title: ad.title,
                               callToAction: ad.callToAction,
                               image: UIImage(named: ad.imageName) ?? nil,
                               link: ad.link)
    }
}

enum NewsItemStyle: String, Decodable {
    case topImageCard = "top_image_card"
    case bottomImageCard = "bottom_image_card"
    case mini = "mini"
    
    func cellIdentifier() -> String {
        switch self {
        case .topImageCard:
            return TopImageCardCollectionViewCell.identifier
        case .bottomImageCard:
            return BottomImageCardCollectionViewCell.identifier
        case .mini:
            return MiniCardCollectionViewCell.identifier
        }
    }
    
    var desiredHeight: CGFloat {
        switch self {
        case .topImageCard:
            return TopImageCardCollectionViewCell.desiredHeight
        case .bottomImageCard:
            return BottomImageCardCollectionViewCell.desiredHeight
        case .mini:
            return MiniCardCollectionViewCell.desiredHeight
        }
    }
}

extension NewsViewModel {
    static func from(_ newsItem: NewsItem) -> NewsViewModel {
        let image = UIImage(named: newsItem.imageName ?? "") ?? UIImage()
        let defaultStyle = NewsItemStyle.topImageCard
        let style = NewsItemStyle(rawValue: newsItem.style) ?? defaultStyle
        return NewsViewModel(title: newsItem.title,
                             category: newsItem.category.uppercased(),
                             author: newsItem.authorName,
                             image: image,
                             style: style,
                             ad: NewsAdViewModel.from(newsItem.ad),
                             link: newsItem.link)
    }
}
