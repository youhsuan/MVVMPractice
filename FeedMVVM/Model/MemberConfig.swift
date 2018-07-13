//
//  MemberConfig.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/13.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

struct Member: Feed {
    var id: String = "2"
    var name: String
    var isSelected: Bool
    var image: UIImage
    
    init(name: String, isSelected: Bool, image: UIImage){
        self.name = name
        self.isSelected = isSelected
        self.image = image        
    }
    
}
