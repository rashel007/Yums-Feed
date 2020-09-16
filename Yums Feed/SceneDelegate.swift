//
//  SceneDelegate.swift
//  Yums Feed
//
//  Created by Estique on 9/13/20.
//  Copyright © 2020 Estique. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        
        let tabView = UITabBarController()
        
        let icons = ["house", "category", "search", "heart"]
        
        
        let homeVC = UINavigationController(rootViewController: HomeViewController.instantiate())
        homeVC.title = "Home"
        
        let categoryVC = UINavigationController(rootViewController: CategoriesViewController.instantiate())
        categoryVC.title = "Categories"
        
        let searchVC = UINavigationController(rootViewController: SearchViewController.instantiate())
        searchVC.title = "Search"
        
        let profileVC = UINavigationController(rootViewController: ProfileViewController.instantiate())
        profileVC.title = "Profile"
        
        
        tabView.setViewControllers([homeVC, categoryVC, searchVC, profileVC], animated: false)
        
        
        guard let items = tabView.tabBar.items else {
            return
        }
        
        
        for x in 0..<items.count {
        
            items[x].image = UIImage(named: icons[x])
        }
        
        window.rootViewController = tabView
        window.makeKeyAndVisible()
        
    }




}

