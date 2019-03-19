import Foundation

// Simulates a database

protocol NewsCaching {
    func newsText(for id: String) -> String
}

struct NewsCache: NewsCaching {
  
    func newsText(for id: String) -> String {
        
    }
}

TODO:

- news details
- ad details with view
- another cell from the beginning
- another theme
- unit tests
- ui tests 
