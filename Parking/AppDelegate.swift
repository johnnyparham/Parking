//
//  AppDelegate.swift
//  Parking
//
//  Created by Johnny Parham on 6/24/16.
//  Copyright © 2016 Johnny Parham. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        Parse.setApplicationId("xsCfDCtB63IlN3J28jjSlBcXxB9D0xQ5a3DDOdQz", clientKey: "AfrmxGFGYzkF2jwj5SDjR6cifHh1f0537zRLdOC6")
        
        return true
    }
}

