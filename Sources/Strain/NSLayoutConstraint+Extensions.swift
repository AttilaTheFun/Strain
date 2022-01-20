import UIKit

extension NSLayoutConstraint {

    /**
     Modifies the receiver's priority to the given value.
     */
    @discardableResult
    public func with(priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }

    /**
     Sets the receiver's isActive flag to the given value.
     */
    @discardableResult
    public func with(isActive: Bool) -> NSLayoutConstraint {
        self.isActive = isActive
        return self
    }
}
