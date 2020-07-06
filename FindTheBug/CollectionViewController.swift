//
//  CollectionViewController.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 01/07/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewController: UICollectionViewController {
    let items: [String] = ["Hello", "Carousel", "More carousel", "carousel cell", "lots of cells", "yay cells"]
    let items2: [String] = ["Cat", "Dog", "walrus", "llama", "Fish"]
    private var cellChildViewControllers = [IndexPath: UIViewController]()
    private lazy var dataSource: UICollectionViewDataSource = createDataSource()
    var shouldRefresh = false {
        didSet {
            DispatchQueue.main.async {
                if #available(iOS 13.0, *) {
                    self.updateDataSource()
                } else {
                    self.collectionView.reloadData()
                }
            }
        }
    }

    init() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 50)
        super.init(collectionViewLayout: layout)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "carouselcell")
        collectionView.backgroundColor = .white
        cellChildViewControllers = [IndexPath(item: 0, section: 0): makeCarousel(strings: items), IndexPath(item: 1, section: 0): makeCarousel(strings: items2)]
        shouldRefresh = true
    }

    func makeCarousel(strings: [String]) -> UIViewController {
        return CarouselCollectionViewController(items: strings)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(shouldRefresh) {
            return 2
        }
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselcell", for: indexPath) as! CarouselCell
        collectionViewCell.childView = cellChildViewControllers[indexPath]?.view
        return collectionViewCell
    }

    private func getCellAtIndex(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselcell", for: indexPath) as! CarouselCell
        collectionViewCell.childView = cellChildViewControllers[indexPath]?.view
        return collectionViewCell
    }

    private func updateDataSource() {
        guard #available(iOS 13.0, *), let dataSource = dataSource as? DiffableDataSource else { return }
        var snapshot = DiffableDataSourceSnapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(self.cellChildViewControllers.map{ $0.value })
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    private func createDataSource() -> UICollectionViewDataSource {
        guard #available(iOS 13.0, *) else { return self }
        return DiffableDataSource(collectionView: collectionView) { [weak self] (collectionView, index, cell) -> UICollectionViewCell? in
            self?.getCellAtIndex(collectionView, cellForItemAt: index)
        }
    }
}

@available(iOS 13.0, *)
extension CollectionViewController {
    enum Section {
        case main
    }

    typealias DiffableDataSource = UICollectionViewDiffableDataSource<Section, UIViewController>
    typealias DiffableDataSourceSnapshot = NSDiffableDataSourceSnapshot<Section, UIViewController>
}
