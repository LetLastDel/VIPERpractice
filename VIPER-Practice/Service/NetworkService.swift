//
//  NetworkService.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol INetworkService {
	func getMovie(server: Server, endPoint: EndPoint) async throws -> PopularMovieResponceEntity
	func dwImage(server: Server,endPoint: EndPoint, url: String) async throws -> UIImage? 

}

class NetworkService: INetworkService {
	var urlManager: IURLManager
	
	init(urlManager: IURLManager) {
		self.urlManager = urlManager
	}
	
	func getMovie(server: Server, endPoint: EndPoint) async throws -> PopularMovieResponceEntity {
		guard let url = urlManager.createURL(server: server, endPoint: endPoint, image: false, imageURL: "") else { throw NetworkError.badUrl}
		let responce = try await URLSession.shared.data(from: url)
		let data = responce.0
		let decoder = JSONDecoder()
		do{
			let movies = try decoder.decode(PopularMovieResponceEntity.self, from: data)
			return movies
		} catch {
			throw NetworkError.invalidDecoding
		}
	}
	
	func dwImage(server: Server,endPoint: EndPoint, url: String) async throws -> UIImage? {
		guard let url = urlManager.createURL(server: server, endPoint: endPoint, image: true, imageURL: url) else { throw NetworkError.badUrl}
		do {
			let responce = try await URLSession.shared.data(from: url)
			let data = responce.0
			guard let image = UIImage(data: data) else {
				return nil
			}
			return image
		} catch {
			return nil
		}
	}
}

enum NetworkError: Error{
	case badUrl, badResponse, invalidDecoding
}
