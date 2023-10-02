//
//  ListOfMoviewInteractor.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IListOfMoviewInteractor: AnyObject{
	func getListOfMovies() async throws -> PopularMovieResponceEntity
	func getImage(url: String) async throws -> UIImage? 
}

class ListOfMoviewInteractor: IListOfMoviewInteractor {
	weak var presenter: IListOfMoviesPresenter?
	var networkService: INetworkService
	
	init(networkService: INetworkService) {
		self.networkService = networkService
	}
	
	func getListOfMovies() async throws -> PopularMovieResponceEntity {
		try await networkService.getMovie(server: Server.mainServer, endPoint: EndPoint.popular)
	}
	
	func getImage(url: String) async throws -> UIImage? {
		return try await networkService.dwImage(server: Server.imageServer, endPoint: EndPoint.empty, url: url)
	}
}
