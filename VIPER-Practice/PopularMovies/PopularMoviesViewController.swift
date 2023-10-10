//
//  PopularMoviesViewController.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

protocol IPopularMovieView: AnyObject {
	func update(movies: [MovieModel])
}

class PopularMoviesViewController: UIViewController {
	var presenter: IPopularMoviesPresenter?
	var mainView = PopularMoviesView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoaded()
		view = mainView
		mainView.collectionView.dataSource = self
		mainView.collectionView.delegate = self
	}
}

extension PopularMoviesViewController: IPopularMovieView {
	func update(movies: [MovieModel]) {
		DispatchQueue.main.async{
			self.mainView.collectionView.reloadData()
		}
	}
}

extension PopularMoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		presenter?.movieModels.count ?? 0
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
		let model = presenter?.movieModels[indexPath.row]
		cell.configureCell(model: model ?? MovieModel(title: "", overview: "", imageURL: ""))
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		presenter?.onTapCell(index: indexPath.row)
	}
}

