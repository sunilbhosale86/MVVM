//
//  Helper.swift
//  ProjectTemplate
//
//  Created by Sunil Bhosale on 8/12/19.
//  Copyright © 2019 Sunil Bhosale. All rights reserved.
//

import Foundation

class Helper
{
    class func infoForKey(_ key: String) -> String?
    {
        return (Bundle.main.infoDictionary?[key] as? String)?
            .replacingOccurrences(of: "\\", with: "")
    }
    
    
    /// Create Errpr
    ///
    /// - Parameters:
    ///   - domain: Error
    ///Domain e.g. Validation Error, Network Error, Invalid Response Error etc.
    ///   - code: Error code
    ///   - description: Error description e.g. Internet not available
    ///   - reason: Error Reason e.g. Internet not avail
    ///   - suggestion: suggestion e.g. Retry, Reload etc.
    ///   - recoveryOptions: recoveryOptions  e.g. Ok, Cancel etc. can be used to create buttons on alert.
    /// - Returns: NSError object
    public class func Error(domain: String, code: Int, description: String, reason: String, suggestion: String, recoveryOptions: [String]) -> NSError
    {
        let userInfo : [String : Any] = [NSLocalizedDescriptionKey : description, NSLocalizedFailureReasonErrorKey : reason, NSLocalizedRecoverySuggestionErrorKey : suggestion, NSLocalizedRecoveryOptionsErrorKey:recoveryOptions]
        return  NSError(domain:domain, code:code, userInfo: userInfo)
    }
}


