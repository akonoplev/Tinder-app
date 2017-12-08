//
//  PersonViewModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 05.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class PersonViewModel: ViewModel {
    var user: UserModel!
    var tableViewCellsArray = [PropertiesViewModel]()
    
    func getCellForCollectionView(index: Int)-> PhotosCellViewModel {
        return PhotosCellViewModel(photo_url: self.user.photos[index] as! String)
    }
    
}

extension PersonViewModel {
    func getUserInfo() -> [String] {
        let allProperties: [String] = [user.name, user.age, String(user.distance), user.workInfo]
        var properties = [String]()
        
        for property in allProperties {
            if property != "" {
                properties.append(property)
                self.tableViewCellsArray.append(PropertiesViewModel(property: property))
            }
        }
        return properties
    }
}
