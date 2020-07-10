//
//  CollectionViewTextCell.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import UIKit

protocol CollectionViewTextCellDelegate: AnyObject {
    func cellTapped()
}

class CollectionViewTextCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!

    weak var delegate: CollectionViewTextCellDelegate?

    func configure(accesibilityString: String) {
        self.accessibilityLabel = accesibilityString
        self.label.text = accesibilityString
        backgroundColor = .red

        let gestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        addGestureRecognizer(gestureRecogniser)
    }

    @objc func cellTapped() {
        delegate?.cellTapped()
    }
}
