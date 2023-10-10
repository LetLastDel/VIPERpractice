//
//  SceneDelegate.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 29.09.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
	
	var window: UIWindow?
	var listOfMoviesRouter = MovieListRouter()
	var containerViewController = ContainerViewController()
	
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let scene = (scene as? UIWindowScene) else { return }
		window = UIWindow(windowScene: scene)
		containerViewController.makeWindow(window: window)
	}
}

