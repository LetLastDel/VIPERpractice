//
//  PopularMovieEntity.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation

/// Результат запроса по URL, содержит в себе массив сущностей списка фильма
struct PopularMovieResponceEntity: Decodable {
	let results: [PopularMovieEntity]
}

struct PopularMovieEntity: Decodable {
	var id: Int
	var title: String
	var overview: String
	var imageURL: String
	var votes: Double
	
	enum CodingKeys: String, CodingKey {
		case id, title, overview
		case imageURL = "poster_path"
		case votes = "vote_average"
	}
}
