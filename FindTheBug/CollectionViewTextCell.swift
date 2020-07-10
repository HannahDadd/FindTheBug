//
//  CollectionViewTextCell.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import Foundation
import SwiftUI

protocol CollectionViewTextCellDelegate : AnyObject {
    func buttonPressed()
}

class CollectionViewTextCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    var button : UIButton?

    weak var delegate: CollectionViewTextCellDelegate?

    deinit {
        print("uh oh")
    }

    @IBAction func buttonPressed(_ sender: Any) {
        delegate?.buttonPressed()
    }

    func configure(accesibilityString: String) {
        self.accessibilityLabel = accesibilityString
        self.label.text = accesibilityString

        let uiGestureRecogniser = UIGestureRecognizer(target: self, action: #selector(buttonPressed(_:)))
        label.addGestureRecognizer(uiGestureRecogniser)
    }
}
