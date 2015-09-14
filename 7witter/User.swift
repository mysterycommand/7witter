//
//  User.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import Foundation

class User {
    var name: String?
    var screenName: String?
    var profileImageURLString: String?
    var profileImageURL: NSURL?
    var description: String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImageURLString = dictionary["profile_image_url"] as? String
        profileImageURL = NSURL(string: profileImageURLString!)
        description = dictionary["description"] as? String
    }
}