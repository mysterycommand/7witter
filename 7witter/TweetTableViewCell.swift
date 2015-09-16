//
//  TweetTableViewCell.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    var userProfileImageView = UIImageView()
    var userNameLabel = UILabel()
    var userScreenNameLabel = UILabel()
    
    var createdAtLabel = UILabel()
    var tweetLabel = UILabel()
    
    var actionsView = ActionsView()
    
    var tweet: Tweet? {
        didSet {
            if let tweet = tweet {
                if let user = tweet.user {
                    userProfileImageView.setImageWithURL(user.profileImageURL)
                    userNameLabel.text = user.name
                    userScreenNameLabel.text = "@" + user.screenName!
                }
                
                let formatter = NSDateFormatter()
                formatter.dateStyle = .ShortStyle
                formatter.timeStyle = .NoStyle
                createdAtLabel.text = formatter.stringFromDate(tweet.createdAt!)
                
                tweetLabel.text = tweet.text
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userProfileImageView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        userProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        userProfileImageView.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(userProfileImageView)
        
        userNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userNameLabel.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(userNameLabel)
        
        userScreenNameLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        userScreenNameLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        userScreenNameLabel.translatesAutoresizingMaskIntoConstraints = false
        // userScreenNameLabel.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(userScreenNameLabel)
        
        createdAtLabel.textColor = UIColor(white: 0.5, alpha: 1.0)
        createdAtLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.3)
        createdAtLabel.textAlignment = .Right
        createdAtLabel.setContentCompressionResistancePriority(UILayoutPriority(999), forAxis: .Horizontal)
        createdAtLabel.translatesAutoresizingMaskIntoConstraints = false
        // createdAtLabel.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(createdAtLabel)

        tweetLabel.font = UIFont.systemFontOfSize(12.0, weight: 0.1)
        tweetLabel.numberOfLines = 0
        tweetLabel.translatesAutoresizingMaskIntoConstraints = false
        // tweetLabel.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(tweetLabel)
        
        actionsView.translatesAutoresizingMaskIntoConstraints = false
        actionsView.backgroundColor = UIColor.randomColor()
        
        contentView.addSubview(actionsView)
        
        let views = [
            "prof": userProfileImageView,
            "name": userNameLabel,
            "scre": userScreenNameLabel,
            "crea": createdAtLabel,
            "twee": tweetLabel,
            "acti": actionsView
        ]
        
        contentView.addConstraints(Vfl.make("H:|-8-[prof(50@999)]-4-[name]-4-[scre]-4-[crea]-8-|", views: views))
        contentView.addConstraints(Vfl.make("H:|-8-[prof]-4-[twee]-8-|", views: views))
        contentView.addConstraints(Vfl.make("H:|-4-[acti]-4-|", views: views))
        contentView.addConstraints(Vfl.make("V:|-8-[name]-4-[twee]-(>=8)-[acti]|", views: views))
        contentView.addConstraints(Vfl.make("V:|-8-[scre]", views: views))
        contentView.addConstraints(Vfl.make("V:|-8-[crea]", views: views))
        contentView.addConstraints(Vfl.make("V:|-8-[prof(50)]-(>=8)-[acti]|", views: views))
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
