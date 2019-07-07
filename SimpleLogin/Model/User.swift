//
//  User.swift
//  SimpleLogin
//
//  Created by Yonas on 7/4/19.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation

class User{
    var id: Int?;
    var email: String?;
    var fname: String?;
    var lname: String?;
    var avatar: String?;
    
    init(ID id: Int, Email email: String, Fname fname: String, Lname lname: String, Avatar avatar: String) {
        self.id = id;
        self.email = email;
        self.fname = fname;
        self.lname = lname;
        self.avatar = avatar;
    }
}



