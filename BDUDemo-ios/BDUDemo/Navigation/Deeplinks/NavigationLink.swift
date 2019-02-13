import Foundation

enum NavigationPage: String, CaseIterable {
    case ad
    case newsDetail = "news"
}

struct NavigationLink {
    private let urlString: String
    
    static func make(from link: NewsLink) -> NavigationLink? {
        guard let urlString = link.app else { return nil }
        return NavigationLink(urlString: urlString)
    }
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    var navigationPage: NavigationPage? {
        guard let page = page else { return nil }
        return NavigationPage(rawValue: page)
    }
    
    var id: String? {
        return urlComponents[safe: 2]
    }
    
    func isValid() -> Bool {
        guard urlComponents.count == 3 else { return false }
        let isValidApp = app == "newsfeed"
        let isValidPage = NavigationPage.allCases.map { $0.rawValue }.contains(page)
        return isValidApp && isValidPage
    }
    
    // MARK: - Private
    
    private var urlComponents: [String] {
        return urlString.components(separatedBy: ":")
    }
    
    private var app: String? {
        return urlComponents[safe: 0]
    }
    
    private var page: String? {
        return urlComponents[safe: 1]
    }
}
