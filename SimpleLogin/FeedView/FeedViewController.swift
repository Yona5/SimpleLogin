//
//  FeedViewController.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedIndicator: UIActivityIndicatorView!
    @IBOutlet weak var feedTable: UITableView!
    var users : [User] = [];
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.dataSource = self;
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil);
        feedTable.register(nib, forCellReuseIdentifier: "ProfileIdentifier");
        feedTable.rowHeight = UITableView.automaticDimension;
        self.feedIndicator.alpha = 1;
        self.feedIndicator.startAnimating();
        makeApiCall();
    }
    
    func makeApiCall(){
        let getCall = ApiGetCall();
        getCall.makeGetApiCall(URL: "https://reqres.in/api/users?page=2" , success: { (users) in
            self.users = users;
            DispatchQueue.main.async {
                self.feedTable.reloadData();
                self.feedIndicator.stopAnimating();
                self.feedIndicator.alpha = 0;
            }
        }) { (error) in
            print(error.localizedDescription);
        }
    }
}

extension FeedViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "ProfileIdentifier", for: indexPath) as! ProfileTableViewCell;
        let user = self.users[indexPath.row];
        cell.user = user;
        return cell;
    }
}
