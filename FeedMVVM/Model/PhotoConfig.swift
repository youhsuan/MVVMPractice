//
//  Feeds.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/13.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

struct Photo: Feed {
    var id: String = "1"
    var title: String
    var context: String
    var photoImage: UIImage
    
    init(title: String, context: String, photoImage: UIImage){
        self.title = title
        self.context = context
        self.photoImage = photoImage
    }
}


