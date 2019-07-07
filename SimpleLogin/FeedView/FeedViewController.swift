//
//  FeedViewController.swift
//  SimpleLogin
//
//  Created by Yonas on 7/7/19.
//  Copyright © 2019 example. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    @IBOutlet weak var feedTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.dataSource = self;
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil);
        feedTable.register(nib, forCellReuseIdentifier: "ProfileIdentifier");
    }
}

extension FeedViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
