import UIKit

// MARK: Dimension : Dimension

extension NSLayoutDimension {

    /**
     Creates a constraint for the anchor to equal the given anchor.
     */
    @discardableResult
    public func constrain(
        equalTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the anchor to exceed or equal the given anchor.
     */
    @discardableResult
    public func constrain(
        greaterThanOrEqualTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the anchor to be less than or equal to the given anchor.
     */
    @discardableResult
    public func constrain(
        lessThanOrEqualTo anchor: NSLayoutDimension,
        multiplier: CGFloat = 1.0,
        constant: CGFloat = 0.0,
        activate: Bool = true) -> NSLayoutConstraint
    {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
        constraint.isActive = activate
        return constraint
    }
}

// MARK: Dimension : Constant

extension NSLayoutDimension {
    /**
     Creates a constraint for the anchor to equal the given constant.
     */
    @discardableResult
    public func constrain(equalTo constant: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the anchor to exceed or equal the given constant.
     */
    @discardableResult
    public func constrain(greaterThanOrEqualTo constant: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToConstant: constant)
        constraint.isActive = activate
        return constraint
    }

    /**
     Creates a constraint for the anchor to be less than or equal to the given constant.
     */
    @discardableResult
    public func constrain(lessThanOrEqualTo constant: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToConstant: constant)
        constraint.isActive = activate
        return constraint
    }
}
