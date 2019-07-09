//
//  ProfileTableViewCell.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var _avatar: UIImageView!
    @IBOutlet weak var _name: UILabel!
    @IBOutlet weak var _email: UILabel!

    var user :User?{
        didSet{
            updateUser()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func updateUser(){
        guard let user = user else { return }
        self._name.text =  user.fname! + " " + user.lname!;
        self._email.text = user.email ?? "No lName";
        self._avatar.image = user.avatar;
    }
}
