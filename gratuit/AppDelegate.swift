//
//  AppDelegate.swift
//  gratuit
//
//  Created by Sayam Kanwar on 28/03/22.
//

import UIKit
import Parse

import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let parseConfig = ParseClientConfiguration {
                    $0.applicationId = "e0SodVTsTtcymIXPDvDGAA6e9F903SBkQy4S5Ugr"
                    $0.clientKey = "1LscoC3fmqR9gjhnoei6vHtVcUKUl5dqY5v2LiCx"
                    $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: parseConfig)
        
        GMSServices.provideAPIKey("AIzaSyBluXbCjtGQuJzAd-KZ-BVfzzWQPTiNI3A")
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

