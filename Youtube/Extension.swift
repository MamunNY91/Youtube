//
//  Extension.swift
//  Youtube
//
//  Created by Abdullah A Mamun on 6/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit


extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) ->UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}

extension UIView {
    func addConstraintWithFormat(format:String,views: UIView...)  {
        var viewDict = [String:UIView]()
        for (index,view) in views.enumerate() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDict[key] = view
        }
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(format, options: NSLayoutFormatOptions(), metrics: nil, views: viewDict))
        
    }
}
