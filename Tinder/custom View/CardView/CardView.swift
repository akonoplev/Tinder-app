//
//  configure.swift
//  Tinder
//
//  Created by Андрей Коноплев on 13.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit


class CardView: SwipableCardView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.register(UINib(nibName: "PropertiesCell", bundle: nil), forCellReuseIdentifier: "PropertiesCell")
        collectionView?.register(UINib(nibName: "PhotosCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCell")
        tableView?.backgroundColor = UIColor.clear
        tableView?.backgroundColor = UIColor.clear
    }
    
    
    var cardViewModel: CardViewModel! {
        didSet {

            tableView.reloadData()
            collectionView.reloadData()
        }
    }
    
}

extension CardView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardViewModel.getUserInfo().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertiesCell", for: indexPath) as! PropertiesCell
        cell.viewModel = cardViewModel.tableViewCellsArray[indexPath.row]
        return cell
    }
}

extension CardView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardViewModel.getCountPhotos()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        cell.viewModel = cardViewModel.getCellForCollectionView(index: indexPath.row)
        return cell
    }
}

extension CardView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

