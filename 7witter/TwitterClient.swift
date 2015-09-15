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
    
    private var signInCompletion: ((user: User?, error: NSError?) -> ())?

    /**
    * Singleton pattern for Swift/iOS.
    **/
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
    
    func signIn(completion: (user: User?, error: NSError?) -> ()) {
        signInCompletion = completion
        
        let success = { (credential: BDBOAuth1Credential!) -> Void in
            let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(credential.token)")
            UIApplication.sharedApplication().openURL(authURL!)
        }
        
        let failure = { (error: NSError!) -> Void in
            self.signInCompletion?(user: nil, error: error)
        }
        
        TwitterClient.instance.requestSerializer.removeAccessToken()
        TwitterClient.instance.fetchRequestTokenWithPath(
            "oauth/request_token",
            method: "GET",
            callbackURL: NSURL(string: "sevenwitter://oauth"),
            scope: nil,
            success: success,
            failure: failure
        )
    }
    
    func openURL(url: NSURL) {
        let success = { (credential: BDBOAuth1Credential!) -> Void in
            TwitterClient.instance.requestSerializer.saveAccessToken(credential)
            
            TwitterClient.instance.GET(
                "1.1/account/verify_credentials.json",
                parameters: nil,
                success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
                    if let response = response as? NSDictionary {
                        let user = User(dictionary: response)
                        self.signInCompletion?(user: user, error: nil)
                    }
                },
                failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                    self.signInCompletion?(user: nil, error: error)
                }
            )
            
//            TwitterClient.instance.GET(
//                "1.1/statuses/home_timeline.json",
//                parameters: nil,
//                success: { (operation: AFHTTPRequestOperation!, response: AnyObject!) -> Void in
//                    if let response = response as? [NSDictionary] {
//                        let tweets = response.map({ (dictionary: NSDictionary) -> Tweet in
//                            return Tweet(dictionary: dictionary)
//                        })
//                        print(tweets[0].text)
//                    }
//                },
//                failure: { (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
//                }
//            )
        }
        
        let failure = { (error: NSError!) -> Void in
            self.signInCompletion?(user: nil, error: error)
        }
        
        fetchAccessTokenWithPath(
            "oauth/access_token",
            method: "POST",
            requestToken:
            BDBOAuth1Credential(queryString: url.query),
            success: success,
            failure: failure
        )
    }
}
