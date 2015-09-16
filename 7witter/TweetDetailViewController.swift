//
//  TweetDetailViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/15/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {

    var userView = UserView()
    
    var tweetLabel = UILabel()
    var createdAtLabel = UILabel()
    
    var actionsView = ActionsView()
    
    var tweet: Tweet? {
        didSet {
            if let tweet = tweet {
                userView.user = tweet.user
                tweetLabel.text = tweet.text

                let formatter = NSDateFormatter()
                formatter.dateStyle = .ShortStyle
                formatter.timeStyle = .ShortStyle

                createdAtLabel.text = formatter.stringFromDate(tweet.createdAt!)
            }
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "7weet"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = UIColor.randomColor()
        
        /**
        * MAIN SUBVIEWS
        */
        userView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        userView.translatesAutoresizingMaskIntoConstraints = false
        userView.backgroundColor = UIColor.randomColor()
        
        view.addSubview(userView)
        
        tweetLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.1)
        tweetLabel.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        tweetLabel.translatesAutoresizingMaskIntoConstraints = false
        tweetLabel.backgroundColor = UIColor.randomColor()
        tweetLabel.numberOfLines = 0
        tweetLabel.sizeToFit()
        
        view.addSubview(tweetLabel)
        
        createdAtLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        createdAtLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        createdAtLabel.textAlignment = .Right
        createdAtLabel.setContentCompressionResistancePriority(UILayoutPriority(999), forAxis: .Horizontal)
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        // createdAtLabel.backgroundColor = UIColor.randomColor()
        
        view.addSubview(createdAtLabel)
        
        actionsView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        actionsView.translatesAutoresizingMaskIntoConstraints = false
        actionsView.backgroundColor = UIColor.randomColor()
        
        view.addSubview(actionsView)
        
        let views = [
            "user": userView,
            "twee": tweetLabel,
            "crea": createdAtLabel,
            "acti": actionsView,
        ]
        
        view.addConstraints(Vfl.make("H:|-8-[user]-8-|", views: views))
        view.addConstraints(Vfl.make("H:|-16-[twee]-16-|", views: views))
        view.addConstraints(Vfl.make("H:|-16-[crea]-16-|", views: views))
        view.addConstraints(Vfl.make("H:|-8-[acti]-8-|", views: views))
        view.addConstraints(Vfl.make("V:|-8-[user(66)]-4-[twee]-4-[crea]-[acti]", views: views))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
