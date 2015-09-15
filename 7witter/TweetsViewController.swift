//
//  TweetsViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let signOutButton = UIButton()
    let tableView = UITableView()
    
    var tweets: [Tweet]?

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
        
        signOutButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        signOutButton.translatesAutoresizingMaskIntoConstraints = false
        
        signOutButton.setTitle("Sign Out", forState: .Normal)
        signOutButton.backgroundColor = UIColor.randomColor()
        signOutButton.addTarget(self, action: "signOutTouchUpInside:event:", forControlEvents: .TouchUpInside)
        
        view.addSubview(signOutButton)
        
        tableView.frame = UIScreen.mainScreen().bounds
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.randomColor()
        tableView.registerClass(TweetTableViewCell.self, forCellReuseIdentifier: "TweetTableViewCell")
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        view.addSubview(tableView)
        
        let views = [
            "signOutButton": signOutButton,
            "tableView": tableView
        ]
        
        view.addConstraints(Vfl.make("H:|-8-[tableView]-8-|", views: views))
        view.addConstraints(Vfl.make("H:|-8-[signOutButton]-8-|", views: views))
        view.addConstraints(Vfl.make("V:|-8-[signOutButton]-8-[tableView]-8-|", views: views))
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        TwitterClient.instance.homeTimeline(nil) { (tweets, error) -> () in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            }
            
            if let error = error {
                print(error)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func signOutTouchUpInside(sender: AnyObject, event: UIEvent) {
        TwitterClient.instance.signOut()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let tweets = self.tweets {
            return tweets.count
        }
        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetTableViewCell", forIndexPath: indexPath)
        
        if let tweet = tweets?[indexPath.row] {
            (cell as? TweetTableViewCell)?.tweet = tweet

            if indexPath.row == (tweets?.count)! - 1 {
                let parameters = [
                    "max_id": tweet.id!
                ]
                
                TwitterClient.instance.homeTimeline(parameters as AnyObject) { (tweets, error) -> () in
                    if let tweets = tweets {
                        self.tweets = self.tweets! + tweets
                        self.tableView.reloadData()
                    }
                }
            }
        }
        
        return cell
    }

}
