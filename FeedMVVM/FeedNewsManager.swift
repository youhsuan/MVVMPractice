//
//  FeedNewsManager.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/15.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

protocol DataViewModelDelegate: class {
    func getData(_ manager: FeedNewsManager, didGetData viewModel: [DataViewModel])
}

class FeedNewsManager {
    
    weak var delegate: DataViewModelDelegate?
    
    func getData() {
        let mockdata: [DataViewModel] = [
            PhotoViewModel(title: "11111", content: "12341234134", photoImg: UIImage(named: "sample")!),
            MemberViewModel(name: "aaaaa", isSelected: false, image: UIImage(named: "profile")!),
            PhotoViewModel(title: "22222", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!),
            PhotoViewModel(title: "33333", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!),
            MemberViewModel(name: "bbbbb", isSelected: false, image: UIImage(named: "profile")!),
            PhotoViewModel(title: "44444", content: "456789skjhljhsljdh", photoImg: UIImage(named: "sample")!)
        ]
        self.delegate?.getData(self, didGetData: mockdata)
    }
    
    
    
    
}
