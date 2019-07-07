//
//  GetAPI.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ApiGetCall: ApiCall{
    
    func makeGetApiCall(URL url: String, success: @escaping (_ users: [User])->(), failure: @escaping (_ error: Error)->()){
        makeApiCall(URL: url, Method: "GET") { (data, response, error) in
            if let error = error{
                failure(error)
            }else if let data = data as? [String:AnyObject]{
                let d = data["data"] as! [[String: AnyObject]]
                let user = d.map({ (adata) -> User in
                    return User.init(ID: adata["id"] as! Int, Email: adata["email"] as! String, Fname: adata["first_name"] as! String, Lname: adata["last_name"] as! String, Avatar: adata["avatar"] as! String)
                })
                success(user)
                //print(d)
            }
        }
    }
}
