//
//  UsersViewController.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet private weak var titleLabel : UILabel? = nil
    @IBOutlet private weak var messsageLabel : UILabel? = nil
    @IBOutlet private weak var tableView : UITableView? = nil
    @IBOutlet private weak var activityIndicator : UIActivityIndicatorView? = nil
    private let viewModel = UsersViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        bind()
        loadData()
    }
    
    /// Bind viewmodel with view
    private func bind()
    {
        // Not using binding since title will be set only once.
        titleLabel?.text = viewModel.title
        
        // Using binding since message will be frequently updated.
        viewModel.message.bind { [weak self] (message) in
            
            self?.messsageLabel?.text = message
        }
        
        // Current status of the viewmodel.
        viewModel.status.bind { [weak self] (status) in
            
            guard let status = status else
            {
               return
            }
            
            switch status
            {
            case .loadingUsers:
                self?.activityIndicator?.startAnimating()
            case .loadingUsersComplete:
                self?.activityIndicator?.stopAnimating()
                self?.tableView?.reloadData()
            case .loadingUsersFailed(let error):
                self?.activityIndicator?.stopAnimating()
                print("Log:" + error.localizedDescription)
            /*case .deletingUsers:
                self?.activityIndicator?.startAnimating()
            case .deletingUsersComplete:
                self?.activityIndicator?.stopAnimating()
                self?.tableView?.reloadData()
            case .deletingUsersFailed(let error):
                self?.activityIndicator?.stopAnimating()
                print(error.description)*/
            }
        }
    }
    
    
    /// Load data
    private func loadData()
    {
        viewModel.load()
    }
    
    // MARK: -tableview Deleage & Datasource-
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return viewModel.numberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 116.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell  = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier) as? UserTableViewCell, let user = viewModel.user(atIndex: indexPath.row)
        {
            cell.configure(user)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        viewModel.toogleUserSelection(atIndex: indexPath.row)
    }
}
