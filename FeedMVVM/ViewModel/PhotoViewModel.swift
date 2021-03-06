//
//  PhotoViewModel.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/14.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

class PhotoViewModel: DataViewModel, ViewModelPressible{
    
    let title: String
    let content: String
    let photoImg: UIImage
    
    var cellPressed: (() -> Void)?
    
    init(title: String, content: String, photoImg: UIImage){
        self.title = title
        self.content = content
        self.photoImg = photoImg
    }
}
