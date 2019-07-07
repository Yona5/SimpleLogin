//
//  PostApi.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class ApiCall{
    
    func makeApiCall(URL url: String!, Method method: String,
        Closure closure: @escaping(_ data: AnyObject?, _ response: URLResponse?, _ error : Error?)->())->(){
        
        let session = URLSession.shared
        guard let url = URL(string: url) else {return}
        var req = URLRequest(url: url)
        req.httpMethod = method
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if (method == "POST") {
            let json = [
                "email": "eve.holt@reqres.in",
                "password": "cityslicka"
            ]
            
            let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
            let task = session.uploadTask(with: req, from: jsonData) { (data, response, error) in
                guard let jsonResponse = (try? JSONSerialization.jsonObject(with: data ?? Data(), options: [])) else{
                    print("no json")
                    return
                }
                closure(jsonResponse as AnyObject,response,error)
            }
            task.resume()

        }else{
            let task = session.dataTask(with: req) { (data, response, error) in
                guard let jsonResponse = (try? JSONSerialization.jsonObject(with: data ?? Data(), options: [])) else{
                    print("no json")
                    return
                }
                closure(jsonResponse as AnyObject,response,error)
            }
            task.resume()
        }
    }
}
