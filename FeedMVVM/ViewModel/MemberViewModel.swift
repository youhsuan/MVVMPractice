//
//  MemberViewModel.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/14.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

class MemberViewModel: CellViewModel{
    let name: String
    let isSelected: Bool
    let image: UIImage
    
    init(name: String, isSelected: Bool, image: UIImage){
        self.name = name
        self.isSelected = isSelected
        self.image = image
    }
}
