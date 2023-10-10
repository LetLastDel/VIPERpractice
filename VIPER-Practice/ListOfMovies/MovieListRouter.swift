//
//  ListOfMoviesRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IMovieListRouter{
	/// Свойство с ссылкой на следующий роутер
	var detailRouter: DetailRouter? { get }
	/// Контроллер со списком фильмов
	var viewController: UIViewController? { get }
	/// Метод, собирающий окно
	/// - Parameter window: возвращает готовый модуль с навигацией
	func makeWindow(window: UIWindow?)
	/// Метод, отправляющий следующему роутеру данные
	/// - Parameter movieId: Выкидывает айди фильма
	func showDetail(movieId: String)
}

class MovieListRouter: IMovieListRouter {
	var detailRouter: DetailRouter?
	var viewController: UIViewController?
	
	init() {
		self.detailRouter = DetailRouter()
	}
	
	func makeWindow(window: UIWindow?) {
		viewController = MovieListModuleBuilder.build()
		let navigationController = UINavigationController(rootViewController: viewController!)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}
	
	func showDetail(movieId: String) {
		guard let vc = viewController else { return }
		detailRouter?.showDetail(from: vc, movieId: movieId, scroll: false)
	}
}

