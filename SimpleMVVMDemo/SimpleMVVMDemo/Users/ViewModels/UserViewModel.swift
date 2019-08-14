//
//  UserViewModel.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation


class UserViewModel
{
    private let user : User
    var id : Int { return user.id }
    var email : String? { return user.email }
    var avatarURL : String {  return user.avatar }
    var fullName : String { return user.first_name + " " + user.last_name }
    var selected : Observable<Bool> = Observable(false)
    
    
    init?(data : [String:Any])
    {        
        guard let user = User(data: data) else
        {
            return nil
        }
        
        self.user = user
    }
    
    func toggleSelection()
    {
        selected.value = !selected.value
    }
}
