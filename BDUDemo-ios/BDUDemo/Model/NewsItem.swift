import Foundation

struct NewsItem: Decodable {
    let id: Int
    let title, category, imageName: String
    let authorName: String? // We can decide to hide the author of a news and get more space for the title
    let style: String
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
