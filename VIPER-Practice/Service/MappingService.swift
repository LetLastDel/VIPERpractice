//
//  MappingService.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation

protocol IMappingService{
	func map(entity: PopularMovieEntity) -> MovieModel
}

struct MappingService: IMappingService{
	
	func map(entity: PopularMovieEntity) -> MovieModel {
		 MovieModel(title: entity.title,
					   overview: entity.overview,
					   imageURL: entity.imageURL)
	}
}
