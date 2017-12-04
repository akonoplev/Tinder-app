//
//  MainViewController.swift
//  Tinder
//
//  Created by Андрей Коноплев on 04.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    weak var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.printSomething()
    }


}
