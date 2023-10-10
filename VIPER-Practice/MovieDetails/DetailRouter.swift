//
//  DetailRouter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit

protocol IDetailRouter: AnyObject{
	/// Идет в билдер, там собирает модуль и показывает нам его
	/// - Parameters:
	///   - from: Принимает в себя предыдущее представление
	///   - movieId: Принимает id фильма для передачи его в билдер
	func showDetail(from: UIViewController, movieId: String, scroll: Bool)
}

class DetailRouter {
	func showDetail(from: UIViewController, movieId: String, scroll: Bool){
		let viewController = DetailModuleBuilder.biuld(movieId: movieId)
		if scroll {
			  from.present(viewController, animated: true)
		} else {
			from.navigationController?.pushViewController(viewController, animated: true)
		}
	}
}


