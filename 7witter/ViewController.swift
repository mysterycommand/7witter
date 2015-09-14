//
//  ViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let signInButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        signInButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        signInButton.setTitle("Sign In with Twitter", forState: .Normal)
        signInButton.backgroundColor = UIColor.randomColor()
        signInButton.addTarget(self, action: "signInTouchUpInside:event:", forControlEvents: .TouchUpInside)
        
        view.addSubview(signInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func signInTouchUpInside(sender: AnyObject, event: UIEvent) {
//        println(sender)
//        println(event)

        let success = { (credential: BDBOAuth1Credential!) -> Void in
//            println(credential)
            let authURL = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(credential.token)")
            UIApplication.sharedApplication().openURL(authURL!)
        }

        let failure = { (error: NSError!) -> Void in
            print(error)
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

}

