//
//  ComposeViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/15/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
    
    let cancelBarButtonItem = UIBarButtonItem()
    let tweetBarButtonItem = UIBarButtonItem()
    
    var userView = UIView()
    var userProfileImageView = UIImageView()
    var userNameLabel = UILabel()
    var userScreenNameLabel = UILabel()
    
    var tweetTextView = UITextView()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.randomColor()

        cancelBarButtonItem.target = self
        cancelBarButtonItem.action = "cancelTouchUpInside:event:"
        cancelBarButtonItem.title = "Cancel"
        navigationItem.setLeftBarButtonItem(cancelBarButtonItem, animated: true)
        
        tweetBarButtonItem.target = self
        tweetBarButtonItem.action = "tweetTouchUpInside:event:"
        tweetBarButtonItem.title = "7weet"
        navigationItem.setRightBarButtonItem(tweetBarButtonItem, animated: true)



        /**
         * MAIN SUBVIEWS
         */
        userView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.backgroundColor = UIColor.randomColor()
        
        view.addSubview(userView)
        updateUserViews()
        
        tweetTextView.font = UIFont.systemFontOfSize(12.0, weight: 0.1)
        tweetTextView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        tweetTextView.translatesAutoresizingMaskIntoConstraints = false
        tweetTextView.backgroundColor = UIColor.randomColor()
        tweetTextView.editable = true
        tweetTextView.sizeToFit()
        
        view.addSubview(tweetTextView)
        
        let views = [
            "user": userView,
            "twee": tweetTextView,
        ]

        view.addConstraints(Vfl.make("H:|-8-[user]-8-|", views: views))
        view.addConstraints(Vfl.make("H:|-8-[twee]-8-|", views: views))
        view.addConstraints(Vfl.make("V:|-8-[user(66)]-4-[twee]-8-|", views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        tweetTextView.becomeFirstResponder()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func cancelTouchUpInside(sender: AnyObject, event: UIEvent) {
        tweetTextView.resignFirstResponder()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func tweetTouchUpInside(sender: AnyObject, event: UIEvent) {
        tweetTextView.resignFirstResponder()
        navigationController?.popViewControllerAnimated(true)
    }
    
    func updateUserViews() {
        if let user = User.currentUser {
            userProfileImageView.setImageWithURL(user.profileImageURL)
            userNameLabel.text = user.name
            userScreenNameLabel.text = "@" + user.screenName!
        }



        /**
        * USER SUBVIEWS
        */
        userProfileImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.backgroundColor = UIColor.randomColor()
        
        userView.addSubview(userProfileImageView)
        
        userNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userNameLabel.backgroundColor = UIColor.randomColor()
        
        userView.addSubview(userNameLabel)
        
        userScreenNameLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        userScreenNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userScreenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userScreenNameLabel.backgroundColor = UIColor.randomColor()
        
        userView.addSubview(userScreenNameLabel)
        
        let views = [
            "prof": userProfileImageView,
            "name": userNameLabel,
            "scre": userScreenNameLabel,
        ]
        
        userView.addConstraints(Vfl.make("H:|-8-[prof(50@999)]-4-[name]-8-|", views: views))
        userView.addConstraints(Vfl.make("H:|-8-[prof]-4-[scre]-8-|", views: views))
        userView.addConstraints(Vfl.make("V:|-8-[prof(50@999)]-(>=8)-|", views: views))
        userView.addConstraints(Vfl.make("V:|-8-[name]-4-[scre]-(>=8)-|", views: views))
    }

}
