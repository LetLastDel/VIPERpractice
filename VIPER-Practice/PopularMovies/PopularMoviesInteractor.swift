//
//  PopularMoviesInteractor.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

protocol IPopularMoviesInteractor{
	func getListOfNew() async throws -> PopularMovieResponceEntity
	func getImage(url: String) async throws -> UIImage?
}

class PopularMoviesInteractor: IPopularMoviesInteractor{
	weak var presenter: IMovieListPresenter?
	var networkService: INetworkService
	
	init(networkService: INetworkService) {
		self.networkService = networkService
	}
	
	func getListOfNew() async throws -> PopularMovieResponceEntity {
		try await networkService.getMovie(server: Server.mainServer, endPoint: EndPoint.latest, id: nil, snakeCase: false)
	}
	
	func getImage(url: String) async throws -> UIImage? {
		return try await networkService.dwImage(server: Server.imageServer, endPoint: EndPoint.empty, url: url)
	}
}

