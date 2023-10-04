//
//  DetailEntity.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation

/// Результат запроса по URL
struct DetailEntity: Decodable {
	let title: String
	let overview: String
	let backdropPath: String
	let status: String
	let releaseDate: String
	let voteAverage: Double
	let voteCount: Int
}
