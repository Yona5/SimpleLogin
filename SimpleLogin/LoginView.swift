//
//  LoginView.swift
//  SimpleLogin
//
//  Created by Yonas on 7/4/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        _password.layer.cornerRadius = 30;
//        _password.clipsToBounds = false;
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        let password = _password.text!;
        let email = _email.text!;
        
        if(password.isEmpty || email.isEmpty){
            let alert = UIAlertController(title: "Empty", message: "Enter email and password", preferredStyle: .alert);
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil));
            self.present(alert, animated: true);
        }else{
            let postCall = ApiPostCall();
            postCall.makePostApiCall(URL: "https://reqres.in/api/login") { (token) in
                if(token.isEmpty){
                    print("No token");
                }else{
                    DispatchQueue.main.async {
                        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                        let feedView = storyBoard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
                        self.present(feedView, animated:true, completion:nil);
                    }
                }
            }
        }
    }

}
