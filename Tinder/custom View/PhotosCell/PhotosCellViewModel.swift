//
//  PhotosCellViewModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 08.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class PhotosCellViewModel: ViewModel {
    var photo_URL: String!
    
    required init(photo_url: String) {
        self.photo_URL = photo_url
    }
}
