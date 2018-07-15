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
    var viewModels: [DataViewModel] = []
    let dataSource = FetchedViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.frame = UIScreen.main.bounds
        self.view.addSubview(self.tableView)
        self.tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.cellIdentifier())
        self.tableView.register(UINib(nibName: "MemberTableViewCell", bundle: nil), forCellReuseIdentifier: MemberTableViewCell.cellIdentifier())
        
        self.viewModels = self.dataSource.getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        for viewModel in self.viewModels {
            if let photoVM = viewModel as? PhotoViewModel {
                photoVM.cellPressed = { () in
                    print("photoCell has been pressed")
                }
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataSource = viewModels[indexPath.row]
        if dataSource is MemberViewModel {
            return 70
        }
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = viewModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.getCellIdentifier(viewModel: data), for: indexPath)
        if let cell = cell as? CellConfiguration {
            cell.setup(viewModel: data)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = viewModels[indexPath.row]
        
        if let viewModel = data as? ViewModelPressible {
            viewModel.cellPressed?()
        }
        
    }
    
    private func getCellIdentifier(viewModel :DataViewModel) -> String {
        switch viewModel {
            case is PhotoViewModel : return PhotoTableViewCell.cellIdentifier()
            case is MemberViewModel: return MemberTableViewCell.cellIdentifier()
            default: fatalError("Unexpected view model type: \(viewModel)")
        }
    }

}
