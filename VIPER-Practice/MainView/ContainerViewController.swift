//
//  ContainerViewController.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//


import Foundation
import UIKit

class ContainerViewController: UIViewController {
	var scrollModule: UIViewController!
	var tableModule: UIViewController!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		scrollModule = PopularMoviewBuilder.build()
		scrollModule.view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3)
		tableModule = MovieListModuleBuilder.build()
		tableModule.view.frame = CGRect(x: 0, y: view.frame.height/4, width: view.frame.width, height: view.frame.height/1.3)
		view.addSubview(scrollModule.view)
		view.addSubview(tableModule.view)
		addChild(scrollModule)
		addChild(tableModule)
		scrollModule.didMove(toParent: self)
		tableModule.didMove(toParent: self)
	}
	
	func makeWindow(window: UIWindow?) {
		let navigationController = UINavigationController(rootViewController: self)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
}
