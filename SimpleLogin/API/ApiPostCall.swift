//
//  ApiPostCall.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ApiPostCall: ApiCall{
    
    func makePostApiCall(URL url: String){
        makeApiCall(URL: url, Method: "POST") { (data, response, error) in
            if let error = error{
                print(error)
            }else if let data = data as? [String:AnyObject]{
                print(data["token"] as! String)
            }
        }
    }
}
