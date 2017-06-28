//
//  VideoCell.swift
//  Youtube
//
//  Created by Abdullah A Mamun on 6/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class BaseCell:UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews()  {
        
    }

}


class VideoCell: BaseCell {
        let thumbnailImageView:UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "linkin-park-759")
        imageView.contentMode = .ScaleAspectFill // in order to have  proper aspect ratio
        imageView.clipsToBounds = true // to clip the image to the bound so that it does not extend beyod the visible bounds
        return imageView
    }()
    let profileImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "s-l225")
        imageView.layer.cornerRadius = 22 //to get circular image the radius should be the half of the height
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let seperatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        return view
    }()
    let titleLabel:UILabel={
        let label = UILabel()
        label.text = "Linkin Park - Numb"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Linkin Park • 1,2223233 views • 3 years"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textView.textColor = UIColor.lightGrayColor()
        return textView
    }()
    
    
     override func setupViews()  {
        addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(profileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        //Horizontal constraint
        addConstraintWithFormat("H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintWithFormat("H:|[v0]|", views: seperatorView)
        addConstraintWithFormat("H:|-16-[v0(44)]", views: profileImageView)
        
        //vertical constraint
        addConstraintWithFormat("V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, profileImageView,seperatorView)
        
        
        //constraints for titlelabel
        //top
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Top, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Left, relatedBy: .Equal, toItem: profileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Right, relatedBy: .Equal, toItem: thumbnailImageView, attribute: .Right, multiplier: 1, constant: 0))
        // height
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        //constraints for subtitleTextView
        //top
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 4))
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: profileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: titleLabel, attribute: .Right, multiplier: 1, constant: 0))
        // height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
        
        
    }
}
