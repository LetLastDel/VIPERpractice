//
//  DetailPresenter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit

protocol IDetailPresenter: AnyObject {
	/// Метод, вызываемый при загрузке вью списка фильмов.
	func viewDidLoaded()
	///Свойство, хранящее id выбранного фильма
	var movieId: String { get }
}

class DetailPresenter: IDetailPresenter {
	weak var view: IDetailView?
	private let interactor: IDetailInteractor
	private let mapService: IMappingService
	let movieId: String
	
	init(movieId: String, interactor: IDetailInteractor, mapService: IMappingService) {
		self.movieId = movieId
		self.interactor = interactor
		self.mapService = mapService
	}
	
	func viewDidLoaded() {
		Task{
			let model = try await interactor.getDetailMovie(id: movieId)
			let image = try await interactor.getImage(url: model.backdropPath)
			let detailModel = mapService.detailInfoMap(entity: model, image: image)
			await MainActor.run {
				self.view?.update(movies: detailModel)
			}
		}
	}
}

