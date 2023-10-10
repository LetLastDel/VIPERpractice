//
//  PopularMoviesPresenter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation

protocol IPopularMoviesPresenter: AnyObject{
	var movieModels: [MovieModel] { get set }
	func viewDidLoaded()
	func onTapCell(index: Int)
}

class PopularMoviesPresenter: IPopularMoviesPresenter {
	weak var view: IPopularMovieView?
	private let interactor: IPopularMoviesInteractor
	private let router: IPopularMoviesRouter
	private let mapService: IMappingService
	var movieModels: [MovieModel] = []
	var fetchedMovies: [PopularMovieEntity] = []

	init(interactor: IPopularMoviesInteractor, router: IPopularMoviesRouter, mapService: IMappingService) {
		self.interactor = interactor
		self.router = router
		self.mapService = mapService
	}
	
	func viewDidLoaded(){
		Task{
			fetchedMovies = try await interactor.getListOfNew().results
			movieModels = fetchedMovies.map(mapService.movieInfoMap(entity:))
			for (index, models) in self.movieModels.enumerated() {
				let image = try await interactor.getImage(url: models.imageURL)
				movieModels[index] = MovieModel(title: models.title, overview: models.overview, imageURL: models.imageURL, image: image)
			}
			view?.update(movies: movieModels)
		}
	}
	
	func onTapCell(index: Int) {
		router.showDetail(movieId: fetchedMovies[index].id.description)
	}
}
