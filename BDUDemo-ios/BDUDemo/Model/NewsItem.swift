import Foundation

struct NewsItem: Decodable {
    let id: Int
    let title: String
    let category: String
    let imageName: String?
    let authorName: String? // We can decide to hide the author in the cards and get more space for the title
    
    //Style
    let style: String // top, bottom, mini. Default is top
    
    //Navigation
    let link: NewsLink? // Goes to internal view
    let ad: NewsAd? // Goes to web view
}

struct NewsAd: Decodable {
    let title, callToAction, imageName: String
    let link: NewsLink
}

struct NewsLink: Decodable {
    let app, web: String?
}
