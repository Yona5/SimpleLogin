//
//  GetAPI.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ApiGetCall: ApiCall{
    
    func makeGetApiCall(URL url: String){
        makeApiCall(URL: url, Method: "GET") { (data, response, error) in
            <#code#>
        }
    }
}
