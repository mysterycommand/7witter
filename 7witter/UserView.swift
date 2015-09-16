//
//  UserView.swift
//  7witter
//
//  Created by Matt Hayes on 9/15/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class UserView: UIView {
    
    var userProfileImageView = UIImageView()
    var userNameLabel = UILabel()
    var userScreenNameLabel = UILabel()
    
    var user: User? {
        didSet {
            if let user = user {
                userProfileImageView.setImageWithURL(user.profileImageURL)
                userNameLabel.text = user.name
                userScreenNameLabel.text = "@" + user.screenName!
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        /**
        * USER SUBVIEWS
        */
        userProfileImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.backgroundColor = UIColor.randomColor()
        
        addSubview(userProfileImageView)
        
        userNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userNameLabel.backgroundColor = UIColor.randomColor()
        
        addSubview(userNameLabel)
        
        userScreenNameLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        userScreenNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userScreenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userScreenNameLabel.backgroundColor = UIColor.randomColor()
        
        addSubview(userScreenNameLabel)
        
        let views = [
            "prof": userProfileImageView,
            "name": userNameLabel,
            "scre": userScreenNameLabel,
        ]
        
        addConstraints(Vfl.make("H:|-8-[prof(50@999)]-4-[name]-8-|", views: views))
        addConstraints(Vfl.make("H:|-8-[prof]-4-[scre]-8-|", views: views))
        addConstraints(Vfl.make("V:|-8-[prof(50@999)]-(>=8)-|", views: views))
        addConstraints(Vfl.make("V:|-8-[name]-4-[scre]-(>=8)-|", views: views))
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
