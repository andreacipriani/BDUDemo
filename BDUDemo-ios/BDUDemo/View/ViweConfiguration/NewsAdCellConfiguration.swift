import Foundation

struct NewsAdCellConfiguration {
    let title: String
    let callToAction: String
    let image: UIImage?
    let link: NewsLink
    
    static func from(_ ad: NewsAd?) -> NewsAdCellConfiguration? {
        guard let ad = ad else { return nil }
        return NewsAdCellConfiguration(title: ad.title,
                                       callToAction: ad.callToAction,
                                       image: UIImage(named: ad.imageName) ?? nil,
                                       link: ad.link)
    }
}
