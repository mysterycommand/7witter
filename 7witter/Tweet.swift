//
//  Tweet.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import Foundation

class Tweet {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?

    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary["text"] as? String
        createdAtString = dictionary["created_at"] as? String
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
    }
}