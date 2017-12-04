//
//  UserFabrique.swift
//  Tinder
//
//  Created by Андрей Коноплев on 03.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserFabrique {
    static func getFromJSON(json: JSON) -> UserModel {
        let id = json["_id"].stringValue
        let name = json["name"].stringValue
        let age = json["birth_date"].stringValue
        let workInfo = json["jobs"]["title"].stringValue
        let distance = json["distance_mi"].intValue
        let photos = json["photos"].arrayValue
        print(name)
        let user = UserModel(id: id, name: name, age: age, workInfo: workInfo, distance: distance, photos: photos as NSArray)
        
        return user
    }
}
