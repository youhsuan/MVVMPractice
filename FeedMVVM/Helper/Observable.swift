//
//  Observer.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/15.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import Foundation

class Observable<T>{
    
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T){
        self.value = value
    }
    
    func addObserve(fireNow: Bool = true, _ onChange: ((T)-> Void)?){
        valueChanged = onChange
        if fireNow {
            onChange?(self.value)
        }
    }
    
    func removeObserver(){
        self.valueChanged = nil
    }
    
    
}
