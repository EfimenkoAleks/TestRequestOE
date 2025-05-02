//
//  AppDelegate.swift
//  TestRequestOE
//
//  Created by Aleksandr on 02.05.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var aplicationCoordinator: AplicationCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
    
        let aplicationCoordinator = AplicationCoordinator(window: window)
        aplicationCoordinator.start()
        self.aplicationCoordinator = aplicationCoordinator
        window?.makeKeyAndVisible()
        return true
    }

}

