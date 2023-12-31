//
//  ListOfMoviesPresenter.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation

protocol IMovieListPresenter: AnyObject{
	/// Свойство, предназначенное для хранения моделей фильмов, которые будут отображаться в списке фильмов
	var movieModels: [MovieModel] { get set }
	/// Метод, вызываемый при загрузке вью списка фильмов.
	func viewDidLoaded()
	/// Метод, вызываемый при выборе ячейки списка фильмов.
	/// - Parameter index: Индекс выбранной ячейки
	func onTapCell(index: Int)
}

class MovieListPresenter: IMovieListPresenter{
	weak var view: IMovieListView?
	private let interactor: IMovieListInteractor
	private let router: IMovieListRouter
	private let mapService: IMappingService
	var movieModels: [MovieModel] = []
	var fetchedMovies: [PopularMovieEntity] = []
	
	init(interactor: IMovieListInteractor,router: IMovieListRouter, mapService: IMappingService) {
		self.interactor = interactor
		self.router = router
		self.mapService = mapService
	}
	
	func viewDidLoaded(){
		Task{
			fetchedMovies = try await interactor.getListOfMovies().results
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

