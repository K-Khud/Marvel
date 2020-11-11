//
//  AppDelegate.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		let charactersViewController = ModulesFactory().getCharacterSearchModule()
		let comicsViewController = ModulesFactory().getComicsSearchModule()
		let tabBarViewController = UITabBarController()

		let image1 = UIImage(named: "shield")?.withRenderingMode(.alwaysOriginal)
		let image2 = UIImage(named: "comic-1")?.withRenderingMode(.alwaysOriginal)

		charactersViewController.tabBarItem = UITabBarItem(title: "Heroes", image: image1, tag: 0)
		comicsViewController.tabBarItem = UITabBarItem(title: "Comics", image: image2, tag: 1)

		tabBarViewController.viewControllers = [charactersViewController, comicsViewController]

		let navigationViewController = UINavigationController(rootViewController: tabBarViewController)
		navigationViewController.navigationBar.shadowImage = UIImage()

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigationViewController
		window?.makeKeyAndVisible()

		
		return true
	}
}
