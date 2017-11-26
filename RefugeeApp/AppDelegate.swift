//
//  AppDelegate.swift
//  RefugeeApp
//
//  Created by Mansoor Shah Said on 2017-11-25.
//  Copyright © 2017 Mansoor Shah Said. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var userGlobal:User!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        
        /* For the most part, your application’s window never changes. After the window is created, it stays the same and only the views displayed by it change.
         Every application has at least one window that displays the application’s user interface on a device’s main screen.
         If an external display is connected to the device, applications can create a second window to present content on that screen as well.*/
        
        //Replacing storyboard with own window manually
        /*The UIWindow class’s screen property represents the specific device display on which the window is currently displayed.
         This property contains a screen object—that is, an instance of UIScreen—that contains information about the device display, such as its bounds, mode, and brightness. */
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //make this window visible
        window?.makeKeyAndVisible()
        
        //Root view
        window?.rootViewController = UINavigationController(rootViewController: InitialController())
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

