import Foundation

enum NewsFeedError: Error {
    case networkError(Error?)
    case jsonParsingError(Error?)
}
