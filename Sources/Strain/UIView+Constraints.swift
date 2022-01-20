import UIKit

// MARK: Width

extension UIView {

    /**
     Creates a constraint for the width to match the given value.

     - Parameters:
       - width: The value to constrain the width to.
       - shouldActivate: Whether to activate the constraint prior to returning it. Defaults to true.
     - Returns: The constraint that was created.
     */
    @discardableResult
    public func constrain(width: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        return self.widthAnchor.constrain(equalTo: width, activate: activate)
    }
}

// MARK: Height

extension UIView {

    /**
     Creates a constraint for the height to match the given value.

     - Parameters:
       - height: The value to constrain the height to.
       - activate: Whether to activate the constraint prior to returning it. Defaults to true.
     - Returns: The constraint that was created.
     */
    @discardableResult
    public func constrain(height: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        return self.heightAnchor.constrain(equalTo: height, activate: activate)
    }
}

// MARK: Size

extension UIView {

    /**
     Creates and returns active constraints for the width and height of the receiver to match a fixed size.

     - Parameters:
       - size: The size to constrain the width and height to.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrain(size: CGSize, activate: Bool = true) -> [NSLayoutConstraint] {
        return [
            self.constrain(width: size.width, activate: activate),
            self.constrain(height: size.height, activate: activate),
        ]
    }
}

// MARK: Aspect Ratio

extension UIView {

    /**
     Creates a constraint for the width:height ratio of the receiver.

     - Parameters:
       - aspectRatio: The ratio of width:height to create the constraint for. E.g. a value of 2.0 means the width must be twice that of the height.
       - activate: Whether to activate the constraint prior to returning it. Defaults to true.
     - Returns: The active constraint that was created.
     */
    @discardableResult
    public func constrain(aspectRatio: CGFloat, activate: Bool = true) -> NSLayoutConstraint {
        let constraint = self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: aspectRatio, constant: 0)
        constraint.isActive = activate
        return constraint
    }
}

// MARK: Center

extension UIView {

    /**
     Creates constraints for the centerX and centerY of the receiver to match the given view.

     - Parameters:
       - view: The view to create the constraints from the receiver to.
       - point: The offset for the receiver's center (x and y) from the center of the `view`.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrainCenter(
        to view: UIView,
        offsetBy point: CGPoint = .zero,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        let constraints = [
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: point.x),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: point.y),
        ]
        constraints.forEach { $0.isActive = activate }
        return constraints
    }
}

// MARK: Layout Guides

extension UIView {
    /**
     Creates active constraints between the given edges and the given view.
     That view must either be a superview of the receiver, or a sibling in the hierarchy.
     NOTE: While UIRectEdge and UIEdgeInsets have `left` and `right` values, these are used to create `leading` and `trailing` constraints.

     - Parameters:
       - edges: The edges to create constraints between the receiver and the view for (from their respective anchors).
       - layoutGuide: The layout guide to create the constraints from the receiver to.
       - insets: The insets between the receiver and the given view.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrain(
        edges: UIRectEdge = .all,
        layoutGuide: UILayoutGuide,
        directionalInsets insets: NSDirectionalEdgeInsets = .zero,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        var constraints = [NSLayoutConstraint]()
        if edges.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top))
        }
        if edges.contains(.left) {
            constraints.append(self.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor, constant: insets.leading))
        }
        if edges.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -1 * insets.bottom))
        }
        if edges.contains(.right) {
            constraints.append(self.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor, constant: -1 * insets.trailing))
        }
        constraints.forEach { $0.isActive = activate }
        return constraints
    }
}

// MARK: Edges

extension UIView {

    /**
     Creates active constraints between the given edges and the given view.
     That view must either be a superview of the receiver, or a sibling in the hierarchy.
     NOTE: While UIRectEdge and UIEdgeInsets have `left` and `right` values, these are used to create `leading` and `trailing` constraints.

     - Parameters:
       - edges: The edges to create constraints between the receiver and the view for (from their respective anchors).
       - view: The view to create the constraints from the receiver to.
       - insets: The insets between the receiver and the given view.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrain(
        edges: UIRectEdge = .all,
        to view: UIView,
        insetBy insets: UIEdgeInsets = .zero,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        let directionalInsets = NSDirectionalEdgeInsets(top: insets.top, leading: insets.left, bottom: insets.bottom, trailing: insets.right)
        return self.constrain(edges: edges, to: view, directionalInsets: directionalInsets, activate: activate)
    }

    /**
     Creates active constraints between the given edges and the given view.
     That view must either be a superview of the receiver, or a sibling in the hierarchy.
     NOTE: While UIRectEdge and UIEdgeInsets have `left` and `right` values, these are used to create `leading` and `trailing` constraints.

     - Parameters:
       - edges: The edges to create constraints between the receiver and the view for (from their respective anchors).
       - view: The view to create the constraints from the receiver to.
       - insets: The insets between the receiver and the given view.
       - activate: Whether to activate the constraints prior to returning them. Defaults to true.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrain(
        edges: UIRectEdge = .all,
        to view: UIView,
        directionalInsets insets: NSDirectionalEdgeInsets,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        var constraints = [NSLayoutConstraint]()
        if edges.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top))
        }
        if edges.contains(.left) {
            constraints.append(self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.leading))
        }
        if edges.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * insets.bottom))
        }
        if edges.contains(.right) {
            constraints.append(self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1 * insets.trailing))
        }
        constraints.forEach { $0.isActive = activate }
        return constraints
    }

    /**
     Creates active constraints between the given edges and the opposite edge on the given view.
     This is useful for creating UIStackView-like constraints chaining bottom-top or left-right edges.
     That view must be a sibling in the hierarchy.
     NOTE: While UIRectEdge and UIEdgeInsets have `left` and `right` values, these are used to create `leading` and `trailing` constraints.

     - Parameters:
       - edges: The edges to create constraints between the receiver and the opposite edges on the view for (from their respective anchors).
       - view: The view to create the constraints from the receiver to.
       - offset: The offset between the receiver and the other view.
     - Returns: The array of active constraints that were created.
     */
    @discardableResult
    public func constrain(
        opposingEdges edges: UIRectEdge = .all,
        from view: UIView,
        offsetBy offset: CGFloat = .zero,
        activate: Bool = true)
        -> [NSLayoutConstraint]
    {
        var constraints = [NSLayoutConstraint]()
        if edges.contains(.top) {
            constraints.append(self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: offset))
        }
        if edges.contains(.left) {
            constraints.append(self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: offset))
        }
        if edges.contains(.bottom) {
            constraints.append(self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: -1 * offset))
        }
        if edges.contains(.right) {
            constraints.append(self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -1 * offset))
        }
        constraints.forEach { $0.isActive = activate }
        return constraints
    }
}
