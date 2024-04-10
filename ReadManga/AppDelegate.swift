//
//  AppDelegate.swift
//  ReadManga
//
//  Created by Truong Nguyen Huu on 8/4/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    var topMost: UIViewController? {
        var topController = window?.rootViewController

        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }

        return topController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configApp()
        return true
    }

    private func configApp() {
        let rootVC = HomeViewController()
        let navi = UINavigationController(rootViewController: rootVC)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
    }


}

