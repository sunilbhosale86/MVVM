//
//  User.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation

class User
{
    let id : Int
    let email : String
    let first_name : String
    let last_name : String
    let avatar : String
    
    init?(data:  Dictionary<String,Any>)
    {
        guard let id = data["id"] as? Int,
              let email = data["email"] as? String,
              let first_name = data["first_name"] as? String,
              let last_name = data["last_name"] as? String,
              let avatar = data["avatar"] as? String else
        {
            return nil
        }
        
        self.id = id
        self.email = email
        self.first_name = first_name
        self.last_name = last_name
        self.avatar = avatar
        
    }
}
