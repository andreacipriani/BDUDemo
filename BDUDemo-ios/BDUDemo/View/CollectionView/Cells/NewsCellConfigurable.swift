import Foundation

protocol NewsCellConfigurable {
    func style(with: NewsCellConfiguration)
    var adActionDelegate: AdViewActionLinkDelegate? { get set }
}
