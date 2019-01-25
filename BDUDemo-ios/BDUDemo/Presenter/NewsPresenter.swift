import Foundation

protocol NewsPresenting {
    func loadNews()
    var view: NewsPresenterOutput? { get set }
}

final class NewsPresenter: NewsPresenting {

    weak var view: NewsPresenterOutput?
    private let client: NewsClient
    init(client: NewsClient = NewsClient()) {
        self.client = client
    }
    
    func loadNews() {
        view?.showLoading()
        client.fetchNews(completion: handle(newsResult:))
    }
    
    func handle(newsResult: Result<[NewsItem], NewsFeedError>) {
        newsResult.analysis(ifSuccess: { [weak self] news in
            DispatchQueue.main.async {
                self?.view?.show(news: news.map { NewsViewModel.from($0) })
            }
        }, ifFailure: { [weak self] _  in
            DispatchQueue.main.async {
                self?.view?.showError()
            }
        })
    }
}
