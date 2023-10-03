//
//  URLManager.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation

protocol IURLManager {
	func createURL(server: Server, endPoint: EndPoint, image: Bool, imageURL: String, id: String?) -> URL?
}

class URLManager: IURLManager {
	private var gateway = "https://"
	private var api = "?api_key="
	private var apiKey = "ea7cae59f30a976cf5f53fb15aa72dd7"
	
	func createURL(server: Server, endPoint: EndPoint, image: Bool, imageURL: String, id: String?) -> URL? {
		var str = ""
		if let id = id{
			str = gateway + server.rawValue + endPoint.rawValue + id
		} else {
			str = gateway + server.rawValue + endPoint.rawValue
		}
		if !image{
			str += api + apiKey
		} else {
			str += imageURL
		}
		let url = URL(string: str)
		return url
	}
}

enum Server: String {
	case mainServer = "api.themoviedb.org/"
	case imageServer = "image.tmdb.org/t/p/w200/"
}

enum EndPoint: String {
	case popular = "3/movie/popular"
	case movieInfo = "3/movie/"
	case empty = ""
}
