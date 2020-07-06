//
//  CarouselCell.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import Foundation
import SwiftUI

class CarouselCell: UICollectionViewCell {
    var childView: UIView? {
        didSet {
            if let childView = childView {
                addSubview(childView)
                childView.pinEdgesToSuperview()
            }
        }
    }

    override func prepareForReuse() {
        childView = nil
        childView?.removeFromSuperview()
        super.prepareForReuse()
    }
}

public extension UIView {
    func pinEdgesToSuperview() {
        guard let superview = superview else {
            preconditionFailure("The superview is nil, you need to add this view as a subview before binding the edges to the superview")
        }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
    }
}
