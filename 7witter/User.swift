//
//  User.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import Foundation

private var user: User?
private var userKey = "7witterCurrentUserKey"

extension NSJSONWritingOptions {
    static var None: NSJSONWritingOptions {
        return NSJSONWritingOptions(rawValue: 0)
    }
}

class User {
    var dict: NSDictionary

    var name: String?
    var screenName: String?
    var profileImageURLString: String?
    var profileImageURL: NSURL?
    var description: String?
    
    init(dictionary: NSDictionary) {
        dict = dictionary

        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImageURLString = dictionary["profile_image_url_https"] as? String
        profileImageURL = NSURL(string: profileImageURLString!)
        description = dictionary["description"] as? String
    }
    
    class var currentUser: User? {
        get {
            if user == nil {
                if let data = NSUserDefaults.standardUserDefaults().objectForKey(userKey) as? NSData {
                    let dict: NSDictionary
                    do {
                        dict = try NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers) as! NSDictionary
                        user = User(dictionary: dict)
                    } catch {
        
                    }
                }
            }

            return user
        }
        set {
            user = newValue
            
            if user != nil {
                let data: NSData?
                do {
                    data = try NSJSONSerialization.dataWithJSONObject(user!.dict, options: .None)
                    NSUserDefaults.standardUserDefaults().setObject(data, forKey: userKey)
                    NSUserDefaults.standardUserDefaults().synchronize()
                } catch {
                    // ???
                    NSUserDefaults.standardUserDefaults().setObject(nil, forKey: userKey)
                    NSUserDefaults.standardUserDefaults().synchronize()
                }
            } else {
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: userKey)
                NSUserDefaults.standardUserDefaults().synchronize()
            }
        }
    }
}