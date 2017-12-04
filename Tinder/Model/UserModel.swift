//
//  UserModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 03.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class UserModel {
    var id: String
    var name: String
    var age: String
    var workInfo: String
    var distance: Int
    var photos: NSArray
    
    init(id: String, name: String, age: String, workInfo: String, distance: Int, photos: NSArray) {
        self.id = id
        self.name = name
        self.age = age
        self.workInfo = workInfo
        self.distance = distance
        self.photos = photos
    }
}
