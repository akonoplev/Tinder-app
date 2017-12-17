//
//  MainViewModel.swift
//  Tinder
//
//  Created by Андрей Коноплев on 04.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class MainViewModel: ViewModel {
    
    var peopleArray = [UserModel]()
}

extension MainViewModel {
    func updatePeople(completion: @escaping ()-> Void) {
            DataProvider.getUsers(success: { (arrays) in
                self.peopleArray.append(contentsOf: arrays)
                completion()
            }) { (error) in
                print(error)
            }
    }
    
}
