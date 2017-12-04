//
//  OperationManager.swift
//  Tinder
//
//  Created by Андрей Коноплев on 04.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class OperationManager {
    private static var operationQueue = OperationQueue()
    
    static func addOperation(op: Operation, cancellingQueu cancelFlag: Bool) {
        operationQueue.maxConcurrentOperationCount = 1
        
        if cancelFlag {
            operationQueue.cancelAllOperations()
        }
        operationQueue.addOperation(op)
    }
}
