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
    var feeds: [Feed] = [
        Photo(title: "11111", context: "12341234134", photoImage: UIImage(named: "sample")!),
        Member(name: "aaaaa", isSelected: false, image: UIImage(named: "profile")!),
        Photo(title: "22222", context: "456789skjhljhsljdh", photoImage: UIImage(named: "sample")!),
        Photo(title: "33333", context: "456789skjhljhsljdh", photoImage: UIImage(named: "sample")!),
        Member(name: "bbbbb", isSelected: false, image: UIImage(named: "profile")!),
        Photo(title: "44444", context: "456789skjhljhsljdh", photoImage: UIImage(named: "sample")!)
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
        let feed = feeds[indexPath.row]
        if feed is Member {
            return 70
        }
        return 100
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = feeds[indexPath.row]
        
        if let photoFeed = feed as? Photo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhoto", for: indexPath) as? FeedsTableViewCell
            
            cell?.title.text = photoFeed.title
            cell?.content.text = photoFeed.context
            cell?.photo.image = photoFeed.photoImage
            
            return cell!
        }
        else if let memberFeed = feed as? Member {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellMember", for: indexPath) as? MemberTableViewCell
            
            cell?.profileImg.image = memberFeed.image
            cell?.name.text = memberFeed.name
            cell?.addButton.isHidden = (memberFeed.isSelected)
            
            return cell!
        }
        
        return UITableViewCell()
    }

}
