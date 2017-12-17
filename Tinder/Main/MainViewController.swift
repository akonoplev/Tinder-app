//
//  MainViewController.swift
//  Tinder
//
//  Created by Андрей Коноплев on 04.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    weak var viewModel: MainViewModel! {
        didSet {
            viewModel.updatePeople {
                DispatchQueue.main.async {
                   self.adding()
                }
            }
        }
    }
    
    //var personView: PersonView!
    @IBOutlet weak var cardView: SwipableCardView!
    
    let cardNib = UINib(nibName: "CardView", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func adding() {
        cardView.registerNib(nib: cardNib)
        cardView.delegate = self
        cardView.dataSource = self
    }
}

extension MainViewController: SwipeCardViewDelegate, SwipableCardViewDataSource {
    func swiped(direction: swipeDirections, index: Int) {

    }
    
    func view(view: UIView, atIndex index: Int)
    {
        let viewModel = CardViewModel(user: self.viewModel.peopleArray[index])
        (view as! CardView).cardViewModel = viewModel
        
    }
    
    func numberOfView() -> Int {
        return self.viewModel.peopleArray.count
    }
}



