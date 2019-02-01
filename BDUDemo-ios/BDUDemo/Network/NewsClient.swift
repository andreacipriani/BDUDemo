import Foundation

struct NewsClient {
    private let url = URL(string: "https://lovely-catfish-82.localtunnel.me/news")!

    func fetchNews(completion: @escaping (Result<[NewsItem], NewsFeedError>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil else {
                completion(.failure(NewsFeedError.networkError(error)))
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
        task.resume()
    }
}
