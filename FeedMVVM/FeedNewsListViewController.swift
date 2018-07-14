//
//  FeedNewsListViewController.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/12.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import UIKit

class FeedNewsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView = UITableView()
    var viewModel: [CellViewModel] = [
        PhotoViewModel(title: "11111", content: "12341234134", photoImg: UIImage(named: "sample")!),
        MemberViewModel(name: "aaaaa", isSelected: false, image: UIImage(named: "profile")!),
        PhotoViewModel(title: "22222", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!),
        PhotoViewModel(title: "33333", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!),
        MemberViewModel(name: "bbbbb", isSelected: false, image: UIImage(named: "profile")!),
        PhotoViewModel(title: "44444", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = UIScreen.main.bounds
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib(nibName: "FeedsTableViewCell", bundle: nil), forCellReuseIdentifier: "cellPhoto")
        self.tableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: "cellMember")
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataSource = viewModel[indexPath.row]
        if dataSource is MemberViewModel {
            return 70
        }
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModel[indexPath.row]
        
        if let photoViewModel = data as? PhotoViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhoto", for: indexPath) as? FeedsTableViewCell
           
            cell?.setup(viewModel: photoViewModel)
           
            return cell!
        }
        else if let memberViewModel = data as? MemberViewModel {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellMember", for: indexPath) as? MemberTableViewCell
            
            cell?.setup(viewModel: memberViewModel)
            
            return cell!
        }
        
        return UITableViewCell()
    }

}
