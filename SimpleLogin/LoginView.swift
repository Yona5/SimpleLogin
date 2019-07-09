//
//  LoginView.swift
//  SimpleLogin
//
//  Created by Yonas on 7/4/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class LoginView: UIViewController {

    @IBOutlet weak var _loginBtn: UIButton!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _email: UITextField!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginIndicator.alpha = 0;
        _password.layer.cornerRadius = 23.0
        _password.layer.borderWidth = 1.0
        _email.layer.cornerRadius = 23.0
        _email.layer.borderWidth = 1.0
        _loginBtn.layer.cornerRadius = 23.0
//        _loginBtn.layer.borderWidth = 1.0
//        _password.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func LoginBtn(_ sender: Any) {
        let password = _password.text!;
        let email = _email.text!;
        self.loginIndicator.alpha = 1;
        self.loginIndicator.startAnimating();
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
                        self.loginIndicator.stopAnimating();
                        self.loginIndicator.alpha = 0;
                    }
                }
            }
        }
    }
}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
