import Foundation

typealias URLSessionResponse = (data: Data?, forUrlResponse: URLResponse?, error: Error?)

final class NewsClient {
    private let url = URL(string: "http://localhost:3000/news")!
    
    func fetchNews(completion: @escaping (Result<[NewsItem], NewsFeedError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, urlResponse, error in
            let urlSessionResponse: URLSessionResponse = (data, urlResponse, error)
            self?.handle(urlSessionResponse, with: completion)
        }
        task.resume()
    }
    
    private func handle(_ urlSessionResponse: URLSessionResponse,
                        with completion: @escaping (Result<[NewsItem], NewsFeedError>) -> Void) {
        guard let data = urlSessionResponse.data, urlSessionResponse.error == nil else {
            completion(.failure(NewsFeedError.networkError(urlSessionResponse.error)))
            return
        }
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let news = try decoder.decode([NewsItem].self, from: data)
            completion(.success(news))
        } catch {
            let specialisedError = NewsFeedError.jsonParsingError(error)
            completion(.failure(specialisedError))
        }
    }
}
