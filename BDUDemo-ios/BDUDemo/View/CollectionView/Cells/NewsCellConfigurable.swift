import Foundation

protocol NewsCellConfigurable {
    func style(with: NewsViewModel)
    var adActionDelegate: AdViewActionLinkDelegate? { get set }
}
