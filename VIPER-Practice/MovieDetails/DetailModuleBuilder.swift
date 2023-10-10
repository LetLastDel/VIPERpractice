//
//  DetailModuleBuilder.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 4.10.2023.
//

import Foundation

class DetailModuleBuilder{
	static func biuld(movieId: String) -> DetailViewController {
		let viewController = DetailViewController()
		let interactor = DetailInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapService: MappingService())
		viewController.presenter = presenter
		presenter.view = viewController
		
		return viewController
	}
}
