//
//  UsersViewModel.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation
import Alamofire

class UsersViewModel
{
    enum UsersViewModelStatus
    {
        case loadingUsers
        case loadingUsersComplete
        case loadingUsersFailed(NSError)
       
        /*case deletingUsers
        case deletingUsersComplete
        case deletingUsersFailed(NSError)*/
    }
    
    typealias  currentStatus = UsersViewModelStatus
    let title = "Users"
    private var users = [UserViewModel]()
    private var previouslySelectedUser : UserViewModel? = nil
    var status: Observable<UsersViewModelStatus?> = Observable(nil)
    private var count = 0
    var message : Observable<String> = Observable("")
    
    init()
    {
        updateMessage()
    }
    
    func load()
    {
        status.value = .loadingUsers
        
        guard let url = URL(string:Constants.URLs.users) else
        {
            return
        }
        
        let parameters : [String:Any]? = nil
        
        Alamofire.request(url, method:.get, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil).responseJSON { [weak self](response) in
            
            switch response.result
            {
            case .success(let responseData):
                
                guard let responseData = responseData as?  Dictionary<String,Any>, let usersData = responseData["data"] as? [Dictionary<String,Any>] else
                {
                    let error = Helper.Error(domain: "Invalid Response", code: -1, description: "Unable to load users", reason: "Invalid response", suggestion: "Please try again later", recoveryOptions: ["Cancel","Retry"])
                    self?.status.value = .loadingUsersFailed(error)
                    return
                }
                
                for anUserData in usersData
                {
                    if let anUser = UserViewModel(data: anUserData)
                    {
                        self?.users.append(anUser)
                    }
                }
                
                self?.status.value = .loadingUsersComplete
                
            case .failure(let error):
                
                self?.status.value = .loadingUsersFailed(error as NSError)
            }
        }
    }
    
    func numberOfUsers() -> Int
    {
        return users.count
    }
    
    func user(atIndex index: Int) -> UserViewModel?
    {
        guard index >= 0 && index < numberOfUsers() else
        {
            return nil
        }
        
        return users[index]
    }
    
    func toogleUserSelection(atIndex index: Int)
    {
        guard let user = user(atIndex: index) else
        {
            return
        }
        
        if(user.selected.value == true)
        {
            user.selected.value = false
            count -= 1
        }
        else
        {
            user.selected.value = true
            count += 1
        }
        
        updateMessage()
    }
    
    func deleteUser(atIndex index : Int)
    {
        guard index >= 0 && index < numberOfUsers() else
        {
            return
        }
        
        // TODO : Implement delete user functionality       
    }
    
    private func updateMessage()
    {
        if(count == 0)
        {
            message.value = "0 users selected"
        }
        else
        {
            message.value = count == 1 ? "1 users selected" : "\(count) users selected"
        }       
    }
}
