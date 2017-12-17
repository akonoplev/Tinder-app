//
//  cardViewModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 13.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation


class CardViewModel: ViewModel {
    
    var user: UserModel? 
    var tableViewCellsArray = [PropertiesViewModel]()
    
    required init(user: UserModel) {
        self.user = user
    }
    
    func getCountPhotos()-> Int {
        return self.user?.photos.count ?? 0
    }
    
    func getUserInfo() -> [String] {
        let allProperties: [String] = [user!.name, user!.age, String(user!.distance), user!.workInfo]
        var properties = [String]()
        
        for property in allProperties {
            if property != "" {
                properties.append(property)
                self.tableViewCellsArray.append(PropertiesViewModel(property: property))
            }
        }
        return properties
    }
    
    func getCellForCollectionView(index: Int)-> PhotosCellViewModel {
        return PhotosCellViewModel(photo_url: user!.photos[index] as! String)
    }
}
