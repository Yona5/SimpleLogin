//
//  ApiPostCall.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ApiPostCall: ApiCall{
    var _token: String = "";
    func makePostApiCall(URL url: String, token: @escaping (_ token: String)->()){
        makeApiCall(URL: url, Method: "POST") { (data, response, error) in
            if let error = error{
                print(error)
            }else if let data = data as? [String:AnyObject]{
                self._token = data["token"] as! String;
                token(self._token);
            }
        }
    }
}
