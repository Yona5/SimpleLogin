//
//  GetAPI.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import UIKit

class ApiGetCall: ApiCall{
    
    func makeGetApiCall(URL url: String, success: @escaping (_ users: [User])->(), failure: @escaping (_ error: Error)->()){
        makeApiCall(URL: url, Method: "GET") { (data, response, error) in
            if let error = error{
                failure(error)
            }else if let data = data as? [String:AnyObject]{
                let d = data["data"] as! [[String: AnyObject]]
                let user = d.map({ (adata) -> User in
                    let imageURL = URL(string: adata["avatar"] as! String)!;
                    let data = try? Data(contentsOf: imageURL);
                    let image = UIImage(data: data!);
                    return User.init(ID: adata["id"] as! Int, Email: adata["email"] as! String, Fname: adata["first_name"] as! String, Lname: adata["last_name"] as! String, Avatar: image!)
                })
                success(user)
            }
        }
    }
}
