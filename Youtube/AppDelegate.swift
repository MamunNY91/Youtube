//
//  AppDelegate.swift
//  Youtube
//
//  Created by Abdullah A Mamun on 6/22/17.
//  Copyright © 2017 Abdullah A Mamun. All rights reserved.
//

import UIKit



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()  // shows the window and makes it key window
        let layout = UICollectionViewFlowLayout() /* layout object that organizes items into a grid with optional header and footer views for each section */
        window?.rootViewController = UINavigationController(rootViewController: HomeController(collectionViewLayout:layout))
        UINavigationBar.appearance().barTintColor = UIColor.rgb(96, green: 98, blue: 229)
        application.statusBarStyle = .LightContent
        //to change the background color of status bar
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = UIColor.rgb(59, green: 73, blue: 206)
        window?.addSubview(statusBarBackgroundView)
        window?.addConstraintWithFormat("H:|[v0]|", views: statusBarBackgroundView)
        window?.addConstraintWithFormat("V:|[v0(20)]", views: statusBarBackgroundView)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

