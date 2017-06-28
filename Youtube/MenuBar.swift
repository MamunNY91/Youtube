//
//  MenuBar.swift
//  Youtube
//
//  Created by Abdullah A Mamun on 6/27/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit

class MenuBar: UIView,UICollectionViewDelegate , UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(96, green: 98, blue: 229)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    let cellID = "CellID"
    let imageNames = ["home","trending","subscriptions","account"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.registerClass(MenuCell.self, forCellWithReuseIdentifier: cellID)
        addSubview(collectionView)
        addConstraintWithFormat("H:|[v0]|", views: collectionView)
        addConstraintWithFormat("V:|[v0]|", views: collectionView)
        let selectedIndexPath = NSIndexPath(forItem: 0, inSection: 0)
        collectionView.selectItemAtIndexPath(selectedIndexPath, animated: false, scrollPosition: .None)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.imageWithRenderingMode(.AlwaysTemplate)
        cell.tintColor = UIColor.rgb(14, green: 13, blue: 91)
        
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(frame.width/4, frame.height)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}

class MenuCell: BaseCell {
    let imageView:UIImageView = {
      let iv = UIImageView()
        iv.image = UIImage(named: "home")?.imageWithRenderingMode(.AlwaysTemplate)
        iv.tintColor = UIColor.rgb(14, green: 13, blue: 91)
        return iv
    }()
    override var highlighted: Bool  {
        didSet{
            imageView.tintColor = highlighted ? UIColor.whiteColor() : UIColor.rgb(14, green: 13, blue: 91)
        }
    }
    override var selected: Bool  {
        didSet{
            imageView.tintColor = selected ? UIColor.whiteColor() : UIColor.rgb(14, green: 13, blue: 91)
        }
    }
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView)
        addConstraintWithFormat("H:[v0(28)]", views: imageView)
        addConstraintWithFormat("V:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0))
        
    }
}