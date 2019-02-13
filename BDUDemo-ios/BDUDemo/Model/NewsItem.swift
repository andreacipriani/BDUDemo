import Foundation

//TODO: things should be optional and not shown sometimes

struct NewsItem: Decodable {
    let id: Int
    let title, category, imageName: String
    let authorName: String?
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
