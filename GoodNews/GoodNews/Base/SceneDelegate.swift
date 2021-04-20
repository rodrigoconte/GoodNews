//
//  SceneDelegate.swift
//  GoodNews
//
//  Created by Rodrigo Oliveira on 4/19/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
            
        let window = UIWindow(windowScene: windowScene)
        let navController = UINavigationController(rootViewController: NewsTableViewController())
        
        self.window = window
        
        let navBar = UINavigationBarAppearance()
        navBar.configureWithOpaqueBackground()
        navBar.backgroundColor = .gray
        navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navController.navigationBar.standardAppearance = navBar
        navController.navigationBar.scrollEdgeAppearance = navBar
        
        self.window!.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
}

