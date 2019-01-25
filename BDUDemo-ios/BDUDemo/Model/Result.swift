import Foundation

enum Result<T, E> {
    case success(T)
    case failure(E)
    
    func analysis<Result>(ifSuccess: (T) -> Result, ifFailure: (E) -> Result) -> Result {
        switch self {
        case let .success(value):
            return ifSuccess(value)
        case let .failure(value):
            return ifFailure(value)
        }
    }
}
