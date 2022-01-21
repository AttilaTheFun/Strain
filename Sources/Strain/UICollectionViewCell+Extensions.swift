import UIKit

extension UICollectionViewCell {

    /**
     When adding a view as a subview of a UICollectionViewCell, you *must* add it as a subview of the content view *and* make the bottom constraint priority less
     than required. This is because as part of the UICollectionViewCell autolayout algorithm, during the first layout pass, the height may be zero or incorrect.
     It becomes correct on the second layout pass. This method conveniently does both for you.

     - Parameters:
       - view: The view to add as a subview of the content view and constrain.
     - Returns: The array of constraints that were created.
     */
    @discardableResult
    public func addContentSubview(_ view: UIView) -> [NSLayoutConstraint] {
        self.contentView.addSubview(view)
        var constraints = [
            view.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
        ]
        let bottomConstraint = view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        bottomConstraint.priority = .defaultHigh
        constraints.append(bottomConstraint)
        constraints.forEach { $0.isActive = true }
        return constraints
    }
}
