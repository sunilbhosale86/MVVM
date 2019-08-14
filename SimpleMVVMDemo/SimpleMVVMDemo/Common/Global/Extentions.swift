//
//  GlobalExtentions.swift
//  ProjectTemplate
//
//  Created by Sunil Bhosale on 8/12/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation

extension String
{
    func isValidEmail() -> Bool
    {
        return true
    }
    
    func isValidPassword() -> Bool
    {
        return true
    }
}

// Not an extention but overloading.
func + <key,value>(left: Dictionary<key,value>?, right: Dictionary<key,value>?) -> Dictionary<key,value>?
{
    guard let right = right else
    {
        return left
    }
    
    return left?.reduce(right)
    {
        var new = $0 as [key:value]
        new.updateValue($1.1, forKey: $1.0)
        return new
    }
}
