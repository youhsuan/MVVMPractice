//
//  Extension.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/14.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation
import UIKit

extension UITableViewCell {
    public static func cellIdentifier() -> String {
        return String(describing: self)
    }
}
