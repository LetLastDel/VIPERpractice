//
//  ListOfMoviesRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IMovieListRouter{
	var detailRouter: DetailRouter? { get }
	var viewController: MovieListViewController? { get }
	func showListOfMovies(window: UIWindow?)
	func showDetail(movieId: String)
}

class MovieListRouter: IMovieListRouter{
	var detailRouter: DetailRouter?
	var viewController: MovieListViewController?

	func showListOfMovies(window: UIWindow?) {
		self.detailRouter = DetailRouter()
		let interactor = MovieListInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = MovieListPresenter(interactor: interactor, router: self, mapService: MappingService())
		viewController = MovieListViewController()
		viewController?.presenter = presenter
		presenter.view = viewController

		window?.rootViewController = viewController
		window?.makeKeyAndVisible()
	}
	
	func showDetail(movieId: String) {
		guard let vc = viewController else { return }
		detailRouter?.showDetail(from: vc, movieId: movieId)
	}
}
