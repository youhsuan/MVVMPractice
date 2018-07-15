//
//  CellViewModel.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/14.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation

protocol DataViewModel {}

protocol ViewModelPressible {
    var cellPressed: (()->Void)? {get set}
}
