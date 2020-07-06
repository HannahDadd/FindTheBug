//
//  CollectionViewTextCell.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import Foundation
import SwiftUI

class CollectionViewTextCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!

    func configure(accesibilityString: String) {
        self.accessibilityLabel = accesibilityString
        self.label.text = accesibilityString
    }
}
