//
//  ActionsView.swift
//  7witter
//
//  Created by Matt Hayes on 9/15/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import UIKit

class ActionsView: UIView {
    
    var replyButton = UIButton()
    var retweetButton = UIButton()
    var favoriteButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /**
        * ACTIONS SUBVIEWS
        */

        replyButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        replyButton.translatesAutoresizingMaskIntoConstraints = false
        replyButton.backgroundColor = UIColor.randomColor()
        replyButton.setTitle("↰", forState: .Normal)

        addSubview(replyButton)

        retweetButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        retweetButton.translatesAutoresizingMaskIntoConstraints = false
        retweetButton.backgroundColor = UIColor.randomColor()
        retweetButton.setTitle("⇆", forState: .Normal)

        addSubview(retweetButton)

        favoriteButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.backgroundColor = UIColor.randomColor()
        favoriteButton.setTitle("★", forState: .Normal)

        addSubview(favoriteButton)

        let views = [
            "repl": replyButton,
            "retw": retweetButton,
            "favo": favoriteButton,
        ]

        addConstraints(Vfl.make("H:|-8-[repl]-[retw]-[favo]-8-|", views: views))
        addConstraints(Vfl.make("V:|-8-[repl]-8-|", views: views))
        addConstraints(Vfl.make("V:|-8-[retw]-8-|", views: views))
        addConstraints(Vfl.make("V:|-8-[favo]-8-|", views: views))
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
