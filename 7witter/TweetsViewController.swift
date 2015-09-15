//
//  TweetsViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController {
    
    let signOutButton = UIButton()

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
        signOutButton.setTitle("Sign Out of Twitter", forState: .Normal)
        signOutButton.backgroundColor = UIColor.randomColor()
        signOutButton.addTarget(self, action: "signOutTouchUpInside:event:", forControlEvents: .TouchUpInside)
        
        view.addSubview(signOutButton)
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
    
    func signOutTouchUpInside(sender: AnyObject, event: UIEvent) {
        TwitterClient.instance.signOut()
    }

}
