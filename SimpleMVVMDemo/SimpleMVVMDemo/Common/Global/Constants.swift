//
//  GlobalConstants.swift
//  ProjectTemplate
//
//  Created by Sunil Bhosale on 8/12/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation
import UIKit

class Constants
{
    private init() { }
    
    // MARK: -URLS-
    struct URLs
    {
        private init() { }
        private static let baseURL = Helper.infoForKey("BASE_URL") ?? ""
        static let users = baseURL + "users?page=1"
        static let deleteUser = baseURL + "xyzmnp"
        static let updateUser = baseURL + "xyzmnp"
    }
    
    struct Keys
    {
        private init() { }
        static let data = "data"
    }
    
    // MARK: -COLORS-
    struct Colors
    {
        static let defaultBlue = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
    }
}


