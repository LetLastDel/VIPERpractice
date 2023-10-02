//
//  ListOfMoviesPresenter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
protocol IListOfMoviesPresenter: AnyObject{
	func viewDidLoaded()
	var movieModels: [MovieModel] { get set }
}

class ListOfMoviesPresenter: IListOfMoviesPresenter{
	weak var view: IListOfMoviesView?
	private let interactor: IListOfMoviewInteractor
	private let mapService: IMappingService
	var movieModels: [MovieModel] = []
	
	init(listOfMiviesInteractor: IListOfMoviewInteractor, mapService: IMappingService) {
		self.interactor = listOfMiviesInteractor
		self.mapService = mapService
	}
	
	func viewDidLoaded(){
		Task{
			let models = try await interactor.getListOfMovies().results
				movieModels = models.map(mapService.map(entity:))
			for (index, models) in self.movieModels.enumerated() {
				let image = try await interactor.getImage(url: models.imageURL)
					movieModels[index] = MovieModel(title: models.title, overview: models.overview, imageURL: models.imageURL, image: image)
			}
				view?.update(movies: movieModels)
		}
	}
}

