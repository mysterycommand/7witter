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
    
    var userView = UserView()
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
        
        view.backgroundColor = UIColor.whiteColor()

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
        //userView.backgroundColor = UIColor.randomColor()

        userView.user = User.currentUser
        
        view.addSubview(userView)
        
        tweetTextView.font = UIFont.systemFontOfSize(12.0, weight: 0.1)
        tweetTextView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        tweetTextView.translatesAutoresizingMaskIntoConstraints = false
        //tweetTextView.backgroundColor = UIColor.randomColor()
        tweetTextView.editable = true
        tweetTextView.sizeToFit()
        
        view.addSubview(tweetTextView)
        
        let views = [
            "user": userView,
            "twee": tweetTextView,
        ]

        view.addConstraints(Vfl.make("H:|-8-[user]-8-|", views: views))
        view.addConstraints(Vfl.make("H:|-16-[twee]-16-|", views: views))
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

}
