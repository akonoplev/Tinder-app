//
//  DataProvider.swift
//  Tinder
//
//  Created by Андрей Коноплев on 03.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class DataProvider {
    //первый запрос
    static func getUsers(success: @escaping (_ usersArray: [UserModel])-> Void, failure: @escaping (_ error: String)-> Void) {
        let operation = WorksheetsOperation(success: success, failure: failure)
        OperationManager.addOperation(op: operation, cancellingQueu: true)
    }
}
