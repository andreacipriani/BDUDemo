import Foundation

struct NewsItem: Decodable {
    let id: Int
    let title, category, authorName, imageName: String
    let style: NewsItemStyle
    let link: NewsLink
    let ad: NewsAd?
}

struct NewsAd: Decodable {
    let title, callToAction, imageName: String
    let link: NewsLink
}

struct NewsLink: Decodable {
    let app, web: String?
}

enum NewsItemStyle: String, Decodable {
    case topImageCard = "top_image_card"
    case bottomImageCard = "bottom_image_card"
    
    // TODO: case unknown? default or discard?
    // TODO: light/dark as theme parameter
    
    func cellIdentifier() -> String {
        switch self {
        case .topImageCard:
            return TopImageCardCollectionViewCell.identifier
        case .bottomImageCard:
            return BottomImageCardCollectionViewCell.identifier
        }
    }
}
