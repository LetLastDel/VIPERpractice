//
//  MappingService.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IMappingService{
	func movieInfoMap(entity: PopularMovieEntity) -> MovieModel
	func detailInfoMap(entity: DetailEntity, image: UIImage?) -> DetailModel
}

struct MappingService: IMappingService{
	
	func movieInfoMap(entity: PopularMovieEntity) -> MovieModel {
		MovieModel(title: entity.title,
				   overview: entity.overview,
				   imageURL: entity.imageURL)
	}
	func detailInfoMap(entity: DetailEntity, image: UIImage?) -> DetailModel {
		DetailModel(title: entity.title,
					overview: entity.overview,
					backdropPath: entity.backdropPath,
					image: image)
	}
}
