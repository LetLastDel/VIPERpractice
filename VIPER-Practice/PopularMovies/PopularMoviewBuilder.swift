//
//  PopularMoviewBuilder.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

class PopularMoviewBuilder{
	static func build() -> PopularMoviesViewController {
		let viewController = PopularMoviesViewController()
		let router = PopularMoviesRouter()
		let interactor = PopularMoviesInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = PopularMoviesPresenter(interactor: interactor, router: router, mapService: MappingService())
		router.viewController = viewController
		viewController.presenter = presenter
		presenter.view = viewController
		
		return viewController
	}
}
