//
//  ViewController.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright (c) 2015 Mystery Command. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    
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
        
        view.backgroundColor = UIColor.randomColor()

        signInButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        signInButton.setTitle("Sign In", forState: .Normal)
        signInButton.backgroundColor = UIColor.randomColor()
        signInButton.addTarget(self, action: "signInTouchUpInside:event:", forControlEvents: .TouchUpInside)
        
        view.addSubview(signInButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func signInTouchUpInside(sender: AnyObject, event: UIEvent) {
        TwitterClient.instance.signIn { (user, error) -> () in
            if user != nil {
                self.navigationController?.pushViewController(TweetsViewController(), animated: true)
            }
        }
    }

}

