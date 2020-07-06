//
//  ViewController.swift
//  FindTheBug
//
//  Created by Hannah Billingsley-Dadd on 29/06/2020.
//  Copyright © 2020 hannah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToCarousel(_ sender: Any) {
        let collectionView = CollectionViewController()
        navigationController?.pushViewController(collectionView, animated: false)
    }
}
