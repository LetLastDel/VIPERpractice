//
//  MovieListModuleBuilder.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

class MovieListModuleBuilder {
	static func build() -> MovieListViewController {
		let viewController = MovieListViewController()
		let router = MovieListRouter()
		let interactor = MovieListInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = MovieListPresenter(interactor: interactor, router: router, mapService: MappingService())
		router.viewController = viewController
		viewController.presenter = presenter
		presenter.view = viewController
		
		return viewController
	}
}
