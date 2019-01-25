import Foundation

struct NewsItem: Decodable {
    let id: Int
    let title, category, authorName, imageName: String
    let style: NewsItemStyle
    let link: NewsLink
}

struct NewsLink: Decodable {
    let app, web: String?
}

enum NewsItemStyle: String, Decodable {
    case cardTopLight = "card_top_light"
    case cardBottomLight = "card_bottom_light"
    // case unknown?
    
    func cellIdentifier() -> String {
        switch self {
        case .cardTopLight:
            return TopCardCollectionViewCell.identifier
        case .cardBottomLight:
            return BottomCardCollectionViewCell.identifier
        }
    }
}
