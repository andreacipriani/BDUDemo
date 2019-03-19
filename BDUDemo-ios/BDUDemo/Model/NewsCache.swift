import Foundation

// Simulates a database

protocol NewsCaching {
    func newsText(for id: String) -> String
}

struct NewsCache: NewsCaching {
    func newsText(for id: String) -> String {
        return "TODO"
    }
}
