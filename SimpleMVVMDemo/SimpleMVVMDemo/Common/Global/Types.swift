//
//  Classes.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/14/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation

class Observable<T>
{
    typealias Listener = (T) -> Void
    var listener : Listener?
    
    /*fileprivate(set)*/ var value : T {
        
        didSet
        {
            listener?(value)
        }
    }
    
    init(_ value : T)
    {
        self.value = value
    }
    
    func bind(listener: Listener?)
    {
        self.listener = listener
        listener?(value)
    }
    
    func unbind()
    {
        self.listener = nil
    }
}
