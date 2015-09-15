//
//  Utils.swift
//  7witter
//
//  Created by Matt Hayes on 9/14/15.
//  Copyright © 2015 Mystery Command. All rights reserved.
//

import Foundation

extension NSLayoutFormatOptions {
    static var None: NSLayoutFormatOptions {
        return NSLayoutFormatOptions(rawValue: 0)
    }
}

class Vfl {
    class func make(vfl: String, views: Dictionary<String, UIView>) -> [NSLayoutConstraint] {
        return NSLayoutConstraint.constraintsWithVisualFormat(vfl, options: .None, metrics: nil, views: views)
    }
}