//
//  ColorsDetailViewController.swift
//  RandomColors
//
//  Created by Luiz Filipe Medeira on 26/11/23.
//

import UIKit

class ColorsDetailViewController: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = color ?? UIColor.blue
    }

}
