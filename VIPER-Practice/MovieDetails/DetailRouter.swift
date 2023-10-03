//
//  DetailRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit

protocol IDetailRouter: AnyObject{
	func showDetail(from: UIViewController, movieId: String)
}

class DetailRouter {
	func showDetail(from: UIViewController, movieId: String){
		let interactor = DetailInteractor(networkService: NetworkService(urlManager: URLManager()))
		let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapService: MappingService())
		let viewController = DetailViewController()
		viewController.presenter = presenter
		presenter.view = viewController
		viewController.modalPresentationStyle = .fullScreen
		
		from.present(viewController, animated: true)
	}
}

