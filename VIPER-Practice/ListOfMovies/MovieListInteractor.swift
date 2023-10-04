//
//  ListOfMoviewInteractor.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IMovieListInteractor: AnyObject{
	/// Метод,  для получения списка популярных фильмов.
	/// - Returns: Возвращает модель списка фильмов
	func getListOfMovies() async throws -> PopularMovieResponceEntity
	/// Метод, для загрузки изображения
	/// - Parameter url: Принимает ссылку на изображение
	/// - Returns: Опционально возвращает изображение
	func getImage(url: String) async throws -> UIImage?
}

class MovieListInteractor: IMovieListInteractor {
	weak var presenter: IMovieListPresenter?
	var networkService: INetworkService
	
	init(networkService: INetworkService) {
		self.networkService = networkService
	}
	
	func getListOfMovies() async throws -> PopularMovieResponceEntity {
		try await networkService.getMovie(server: Server.mainServer, endPoint: EndPoint.popular, id: nil, snakeCase: false)
	}
	
	func getImage(url: String) async throws -> UIImage? {
		return try await networkService.dwImage(server: Server.imageServer, endPoint: EndPoint.empty, url: url)
	}
}
