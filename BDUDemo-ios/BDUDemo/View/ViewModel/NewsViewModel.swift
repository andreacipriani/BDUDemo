import Foundation

struct NewsViewModel {
    let title: String
    let subtitle: String
}

extension NewsViewModel {
    static func from(_ newsItem: NewsItem) -> NewsViewModel {
        return NewsViewModel(title: newsItem.title, subtitle: newsItem.subtitle)
    }
}
