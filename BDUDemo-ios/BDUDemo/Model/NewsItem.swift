import Foundation

struct NewsItem: Decodable {
    let id: Int
    let title, subtitle, authorName: String
    let style: NewsItemStyle
    let link: NewsLink
}

struct NewsLink: Decodable {
    let app, web: String?
}

enum NewsItemStyle: String, Decodable {
    case cardLight = "card_light"
    case cardDark = "card_dark"
}
