//
//  AppDelegate.swift
//  CoffeeShops
//
//  Created by Наталья on 07.02.2024.
//

import UIKit
import YandexMapsMobile

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        YMKMapKit.setApiKey("ca5f969e-2189-4013-b6e7-d98cc8a7858f")
//        YMKMapKit.setLocale("ru_RU")
//        YMKMapKit.sharedInstance()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = AuthorizationModuleBuilder.build()
        window?.rootViewController = UINavigationController(rootViewController: rootVC)
        window?.makeKeyAndVisible()
        return true
    }
}

