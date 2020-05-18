//
//  AppDelegate.swift
//  Appoint
//
//  Created by Aman Jaiswal on 07/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift
import Foundation
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        Custom pod file to hide and unhide keyboard for text field.
        IQKeyboardManager.shared.enable = true
        
//
//       window = UIWindow(frame: UIScreen.main.bounds)
//        window?.makeKeyAndVisible()
  
        
        
//        Firebase pods
        
        FirebaseApp.configure()
        let db = Firestore.firestore()
        return true
    }

    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
        
        
         
    }


}

