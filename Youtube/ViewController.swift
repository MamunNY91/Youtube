//
//  ViewController.swift
//  Youtube
//
//  Created by Abdullah A Mamun on 6/22/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController,UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.registerClass(VideoCell.self, forCellWithReuseIdentifier: "CellId")
        
        navigationItem.title = "Home"
        collectionView?.backgroundColor = UIColor.whiteColor()
    }

    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath)
      
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(view.frame.width, 200)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}

class VideoCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let thumbnailImageView:UIImageView = {
       let imageView = UIImageView()
        
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        
        return imageView
    }()
    let profileImageView:UIImageView = {
          let imageView = UIImageView()
        imageView.backgroundColor = UIColor.greenColor()
        return imageView
    }()
    
    let seperatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
       
        return view
    }()
    let titleLabel:UILabel={
        let label = UILabel()
        label.backgroundColor = UIColor.purpleColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let subtitleTextView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.brownColor()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupViews()  {
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
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Top, relatedBy: .Equal, toItem: titleLabel, attribute: .Bottom, multiplier: 1, constant: 8))
        //left
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Left, relatedBy: .Equal, toItem: profileImageView, attribute: .Right, multiplier: 1, constant: 8))
        //right
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Right, relatedBy: .Equal, toItem: titleLabel, attribute: .Right, multiplier: 1, constant: 0))
        // height
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 20))
        
       
        
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
