//
//  API_Wrapper.swift
//  Tinder
//
//  Created by Андрей Коноплев on 03.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation

class API_Wrapper {
    static func getProfile(success: @escaping (_ json: Any)-> Void, failure: @escaping (_ errorDescription: String)-> Void)-> URLSessionDataTask{
        let url = constant.API_data.base_url
        let params : [String: Any] = ["locale": "ru"]
        var request = API_conf.getRequst(url: url, params: params)
        
        request.setValue(constant.API_data.token, forHTTPHeaderField: "x-auth-token")
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, requestError) in
            API_conf.acceptDataFromServer(data: data, RequestError: requestError, success: success, failure: failure)
        }
        dataTask.resume()
        
        return dataTask
        
    }
    
   
    
    
}
