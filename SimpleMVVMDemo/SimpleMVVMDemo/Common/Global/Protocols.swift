//
//  Protocols.swift
//  SimpleMVVMDemo
//
//  Created by Sunil Bhosale on 8/13/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation

protocol ViewModelStatus : class
{
    associatedtype currentStatus
    var status : ((currentStatus) -> Void)? {get set}
}
