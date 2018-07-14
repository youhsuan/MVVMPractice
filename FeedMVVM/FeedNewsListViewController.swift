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
    var viewModel: [DataViewModel] = [
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
        self.tableView.register(UINib(nibName: "FeedsTableViewCell", bundle: nil), forCellReuseIdentifier: FeedsTableViewCell.cellIdentifier())
        self.tableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: MemberTableViewCell.cellIdentifier())
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.getCellIdentifier(viewModel: data), for: indexPath)
        
        if let cell = cell as? CellConfiguration {
            cell.setup(viewModel: data)
        }
        
        return cell
    }
    
    func getCellIdentifier(viewModel :DataViewModel) -> String {
        switch viewModel {
            case is PhotoViewModel : return FeedsTableViewCell.cellIdentifier()
            case is MemberViewModel: return MemberTableViewCell.cellIdentifier()
            default: fatalError("Unexpected view model type: \(viewModel)")
        }
    }

}
