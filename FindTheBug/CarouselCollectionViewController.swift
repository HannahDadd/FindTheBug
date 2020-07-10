//
//  CollectionViewController.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import Foundation
import UIKit

class CarouselCollectionViewController: UICollectionViewController {
    let items: [String]

    init(items : [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.scrollDirection = .horizontal
        self.items = items
        super.init(collectionViewLayout: layout)
    }

    deinit {
        print("Carousel collection view controller has been deinitialised... 😬")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "CollectionViewTextCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .white
        collectionView.allowsSelection = true
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let collectionViewCell: CollectionViewTextCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewTextCell
        collectionViewCell.delegate = self
        collectionViewCell.configure(accesibilityString: items[indexPath.item])
        return collectionViewCell
    }
}

extension CarouselCollectionViewController: CollectionViewTextCellDelegate {

    func cellTapped() {

        let alert = UIAlertController(title: "Alert!", message: "It's Alert From Cell", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
