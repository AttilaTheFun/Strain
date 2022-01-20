import UIKit

extension UIView {

    /**
     Creates constraints between the given edges and the margins of the given view.
     That view must either be a superview of the receiver, or a sibling in the hierarchy.
     NOTE: While UIRectEdge and UIEdgeInsets have `left` and `right` values, these are used to create `leading` and `trailing` constraints.

     - Parameters:
       - edges: The edges to create constraints between the receiver and the view for (from their respective anchors).
       - view: The view whose layout margins are used to create the constraints from the receiver to.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of constraints that were created.
     */
    @discardableResult
    public func constrain(
        edges: UIRectEdge = .all,
        toMarginsOf view: UIView,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        let margins = view.layoutMarginsGuide
        var constraints = [NSLayoutConstraint]()
        if edges.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: margins.topAnchor))
        }
        if edges.contains(.left) {
            constraints.append(self.leadingAnchor.constraint(equalTo: margins.leadingAnchor))
        }
        if edges.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: margins.bottomAnchor))
        }
        if edges.contains(.right) {
            constraints.append(self.trailingAnchor.constraint(equalTo: margins.trailingAnchor))
        }
        constraints.forEach { $0.isActive = activate }
        return constraints
    }
}
