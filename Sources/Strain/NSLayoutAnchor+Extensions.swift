import UIKit

// MARK: Anchor : Anchor

extension NSLayoutAnchor {

    /**
     Creates a constraint for the receiver to equal the given anchor.
     */
    @objc
    @discardableResult
    public func constrain(
        equalTo anchor: NSLayoutAnchor<AnchorType>,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(equalTo: anchor, constant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the receiver to exceed or equal the given anchor.
     */
    @objc
    @discardableResult
    public func constrain(
        greaterThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the receiver to be less than or equal to the given anchor.
     */
    @objc
    @discardableResult
    public func constrain(
        lessThanOrEqualTo anchor: NSLayoutAnchor<AnchorType>,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
        constraint.isActive = activate
        return constraint
    }
}
