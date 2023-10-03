//
//  NetworkService.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol INetworkService {
	func getMovie<T: Decodable>(server: Server, endPoint: EndPoint, id: String?, snakeCase: Bool) async throws -> T
	func dwImage(server: Server,endPoint: EndPoint, url: String) async throws -> UIImage?
}

class NetworkService: INetworkService {
	var urlManager: IURLManager
	
	init(urlManager: IURLManager) {
		self.urlManager = urlManager
	}
	
	func getMovie<T:Decodable>(server: Server, endPoint: EndPoint, id: String?, snakeCase: Bool) async throws -> T {
		guard let url = urlManager.createURL(server: server, endPoint: endPoint, image: false, imageURL: "", id: id) else { throw NetworkError.badUrl}
		print(url)
		let responce = try await URLSession.shared.data(from: url)
		let data = responce.0
		let decoder = JSONDecoder()
		if snakeCase{
			decoder.keyDecodingStrategy = .convertFromSnakeCase
		}
		do{
			let movies = try decoder.decode(T.self, from: data)
			return movies
		} catch {
			throw NetworkError.invalidDecoding
		}
	}
	
	func dwImage(server: Server,endPoint: EndPoint, url: String) async throws -> UIImage? {
		guard let url = urlManager.createURL(server: server, endPoint: endPoint, image: true, imageURL: url, id: nil) else { throw NetworkError.badUrl}
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
