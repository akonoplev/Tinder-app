//
//  WorksheetsOperation.swift
//  Tinder
//
//  Created by Андрей Коноплев on 03.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation
import SwiftyJSON

class WorksheetsOperation: Operation {
    var success: ([UserModel])-> Void
    var failure: (String)-> Void
    
    var internetTask: URLSessionDataTask?
    
    init(success: @escaping ([UserModel])-> Void, failure: @escaping (String)-> Void)  {
        self.success = success
        self.failure = failure
        super.init()
    }
    
    override func cancel() {
        internetTask?.cancel()
    }
    
    override func main() {
        let semaphore = DispatchSemaphore(value: 0)
        
        internetTask = API_Wrapper.getProfile(success: { (response) in
            let responseArray = JSON(response)
            var userArray = [UserModel]()
            
            for user in responseArray["results"].arrayValue {
                userArray.append(UserFabrique.getFromJSON(json: user))
            }
            
            self.success(userArray)
            semaphore.signal()
            
        }, failure: { (error) in
            print(error)
            semaphore.signal()
        })
        
        _ = semaphore.wait(timeout: .distantFuture)
    }
}
