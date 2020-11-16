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
		let authorsViewController = ModulesFactory().getCreatorsSearchModule()

		let tabBarViewController = UITabBarController()

		let shieldImage = UIImage(named: "shield")?.withRenderingMode(.alwaysOriginal)
		let comicsImage = UIImage(named: "comic-1")?.withRenderingMode(.alwaysOriginal)
		let authorsImage = UIImage(named: "writer")?.withRenderingMode(.alwaysOriginal)


		charactersViewController.tabBarItem = UITabBarItem(title: "Heroes", image: shieldImage, tag: 0)
		comicsViewController.tabBarItem = UITabBarItem(title: "Comics", image: comicsImage, tag: 1)
		authorsViewController.tabBarItem = UITabBarItem(title: "Creators", image: authorsImage, tag: 2)

		let controllers = [charactersViewController, comicsViewController, authorsViewController]
			.map{UINavigationController(rootViewController: $0)}

		for controller in controllers {
			controller.navigationBar.shadowImage = UIImage()
			controller.navigationBar.barTintColor = UIColor(named: "headerColor")
			controller.navigationBar.isTranslucent = false
		}

		tabBarViewController.viewControllers = controllers

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = tabBarViewController
		window?.makeKeyAndVisible()
		return true
	}
}
