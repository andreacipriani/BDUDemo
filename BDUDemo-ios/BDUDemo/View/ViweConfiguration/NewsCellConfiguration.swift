import Foundation
import UIKit

struct NewsCellConfiguration {
    let title: String
    let category: String
    let author: String?
    let image: UIImage
    let style: NewsItemStyle
    let ad: NewsAdCellConfiguration?
    let link: NewsLink?
    
    var desiredHeight: CGFloat {
        return style.desiredHeight
    }
}

extension NewsCellConfiguration {
    static func from(_ newsItem: NewsItem) -> NewsCellConfiguration {
        let image = UIImage(named: newsItem.imageName ?? "") ?? UIImage()
        let defaultStyle = NewsItemStyle.topImageCard
        let style = NewsItemStyle(rawValue: newsItem.style) ?? defaultStyle
        return NewsCellConfiguration(title: newsItem.title,
                             category: newsItem.category.uppercased(),
                             author: newsItem.authorName,
                             image: image,
                             style: style,
                             ad: NewsAdCellConfiguration.from(newsItem.ad),
                             link: newsItem.link)
    }
}
