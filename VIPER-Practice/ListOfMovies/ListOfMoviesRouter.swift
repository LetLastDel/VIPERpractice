//
//  ListOfMoviesRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IListOfMoviesRouter{
	func showListOfMovies(window: UIWindow?)
}

class ListOfMoviesRouter{
	func showListOfMovies(window: UIWindow?) {
		let interactor = ListOfMoviewInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = ListOfMoviesPresenter(listOfMiviesInteractor: interactor, mapService: MappingService())
		let viewController = ListOfMoviesViewController()
		viewController.presenter = presenter
		presenter.view = viewController

		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
}
