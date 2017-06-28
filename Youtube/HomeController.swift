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
        let titleLabel = UILabel(frame: CGRectMake(0,0,view.frame.width-32,view.frame.height))
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.text = "Home"
        navigationItem.titleView = titleLabel
        titleLabel.font = UIFont.systemFontOfSize(18)
        navigationController?.navigationBar.translucent = false
        collectionView?.backgroundColor = UIColor.whiteColor()
        setupMenuBar()
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    let menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    private func setupMenuBar()  {
        view.addSubview(menuBar)
        view.addConstraintWithFormat("H:|[v0]|", views: menuBar)
        view.addConstraintWithFormat("V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellId", forIndexPath: indexPath)
      
        return cell
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let height = (view.frame.width - 16 - 16)*9/16  // 16/9 aspect ratio
        return CGSizeMake(view.frame.width, height+84)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
}
