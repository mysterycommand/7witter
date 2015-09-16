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
    
    static let activeColor = UIColor.randomColor()
    static let inactiveColor = ActionsView.activeColor.inverse()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /**
        * ACTIONS SUBVIEWS
        */
        
        let buttonsWithLabels = [
            replyButton: "↰",
            retweetButton: "⇆",
            favoriteButton: "★",
        ]

        for (button, label) in buttonsWithLabels {
            button.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = ActionsView.inactiveColor
            button.setTitle(label, forState: .Normal)
            
            addSubview(button)
        }

        let views = [
            "repl": replyButton,
            "retw": retweetButton,
            "favo": favoriteButton,
        ]

        addConstraints(Vfl.make("H:|-8-[repl]-4-[retw]-4-[favo]", views: views))
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
