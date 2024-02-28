//
//  AppDelegate.swift
//  CleanArchExample
//
//  Created by Mohamed Samy on 31/01/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appEnvironment: AppEnvironemt = .staging
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        DIManager.shared.registerDependencies()
        window = UIWindow(frame: UIScreen.main.bounds)
        let router = Router()
        if let initialViewController = router.setupInitialViewController() {
            let navigationController = UINavigationController(rootViewController: initialViewController)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
        return true
    }

}

