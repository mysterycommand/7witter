//
//  TwitterClient.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import Foundation

private struct Twitter {
    static let baseURL = NSURL(string: "https://api.twitter.com")
    static let consumerKey = "rsgeT4msdIQ8cxBbRnqjdCRYI"
    static let consumerSecret = "YBN3zlPjZe9myTuYdBpbS5kiXr0TbyW2pcttCqcXMTd1J9X7ai"
}

class TwitterClient: BDBOAuth1RequestOperationManager {
    class var instance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(
                baseURL: Twitter.baseURL,
                consumerKey: Twitter.consumerKey,
                consumerSecret: Twitter.consumerSecret
            )
        }

        return Static.instance
    }
}
