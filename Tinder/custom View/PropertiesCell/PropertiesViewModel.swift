//
//  PropertiesViewModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 08.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation


class PropertiesViewModel: ViewModel {
    var property: String!
    
    required init(property: String) {
        self.property = property
    }
}
