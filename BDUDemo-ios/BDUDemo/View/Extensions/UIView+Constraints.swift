import Foundation
import UIKit

public extension UIView {
    
    // MARK: - Public
    
    public func constrainToSuperView() {
        guard let superview = superview else { return }
        constrainTo(view: superview)
    }
    
    public func constrainTo(view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints([
            pinningConstraint(item: self, for: .leading, view: view),
            pinningConstraint(item: self, for: .trailing, view: view),
            pinningConstraint(item: self, for: .top, view: view),
            pinningConstraint(item: self, for: .bottom, view: view),
            ])
    }
    
    // MARK: - Private
    
    private func pinningConstraint(item: UIView, for attribute: NSLayoutConstraint.Attribute, view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: item, attribute: attribute, relatedBy: .equal, toItem: view, attribute: attribute, multiplier: 1.0, constant: 0)
    }
}
