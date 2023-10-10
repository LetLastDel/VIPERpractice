//
//  PopularMoviesRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

protocol IPopularMoviesRouter{
	var detailRouter: DetailRouter? { get }
	var viewController: UIViewController? { get }
	func makeWindow(window: UIWindow?)
	func showDetail(movieId: String)
}

class PopularMoviesRouter: IPopularMoviesRouter{
	var detailRouter: DetailRouter?
	var viewController: UIViewController?
	
	init() {
		self.detailRouter = DetailRouter()
	}
	
	func makeWindow(window: UIWindow?) {
		viewController = PopularMoviewBuilder.build()
		let navigationController = UINavigationController(rootViewController: viewController!)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
	
	func showDetail(movieId: String) {
		guard let vc = viewController else { return }
		detailRouter?.showDetail(from: vc, movieId: movieId, scroll: true)
	}
}
