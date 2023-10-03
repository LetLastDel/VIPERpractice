//
//  DetailInteractor.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit

protocol IDetailInteractor: AnyObject {
	func getDetailMovie(id: String) async throws -> DetailEntity
	func getImage(url: String) async throws -> UIImage?
}

class DetailInteractor: IDetailInteractor {
	var networkService: INetworkService
	
	init(networkService: INetworkService) {
		self.networkService = networkService
	}
	
	func getDetailMovie(id: String) async throws -> DetailEntity {
		return try await networkService.getMovie(server: Server.mainServer, endPoint: EndPoint.movieInfo, id: id, snakeCase: true)
	}
	
	func getImage(url: String) async throws -> UIImage? {
		return try await networkService.dwImage(server: Server.imageServer, endPoint: EndPoint.empty, url: url)
	}
}
