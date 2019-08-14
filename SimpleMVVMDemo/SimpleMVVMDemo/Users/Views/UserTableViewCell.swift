//
//  UserTableViewCell.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import UIKit
import SDWebImage

class UserTableViewCell: UITableViewCell
{
    static var identifier : String = "UserTableViewCell"
    @IBOutlet private weak var userImageView : UIImageView? = nil
    @IBOutlet private weak var fullNameLabel : UILabel? = nil
    @IBOutlet private weak var emailLabel : UILabel? = nil
    @IBOutlet private weak var selectionStateImageView : UIImageView? = nil
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func configure(_ user : UserViewModel)
    {
        fullNameLabel?.text = user.fullName
        emailLabel?.text = user.email
        
        if let url = URL(string: user.avatarURL)
        {
            userImageView?.sd_setImage(with: url, placeholderImage:nil)
        }
        
        user.selected.bind { (selected) in
            
            self.selectionStateImageView?.image = selected ? UIImage(named: "CheckMark") : nil
        }
    }
    

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
