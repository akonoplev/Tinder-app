//
//  File.swift
//  Tinder
//
//  Created by Андрей Коноплев on 04.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import UIKit

class PersonView: UIView {
    
    var viewModel = PersonViewModel()
    
    @IBOutlet var personView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    init(user: UserModel!, frame: CGRect) {
        super.init(frame: frame)
        self.viewModel.user = user
        commonInit()
        registrate()
    }
    
    fileprivate func commonInit() {
        Bundle.main.loadNibNamed("AKPersonView", owner: self, options: nil)
        addSubview(personView)
        personView.frame = self.bounds
        personView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    fileprivate func registrate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.tableView.register(UINib(nibName: "PropertiesCell", bundle: nil), forCellReuseIdentifier: "PropertiesCell")
        self.collectionView.register(UINib(nibName: "PhotosCell", bundle: nil), forCellWithReuseIdentifier: "PhotosCell")
        self.tableView.backgroundColor = UIColor.clear
    }
}

//MARK: form tableView
extension PersonView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getUserInfo().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PropertiesCell", for: indexPath) as! PropertiesCell
        cell.viewModel = self.viewModel.tableViewCellsArray[indexPath.row]
        return cell
    }
}

extension PersonView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.user.photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCell", for: indexPath) as! PhotosCell
        cell.viewModel = self.viewModel.getCellForCollectionView(index: indexPath.row)
        return cell
    }
}

extension PersonView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(UIScreen.main.bounds.width)
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}


