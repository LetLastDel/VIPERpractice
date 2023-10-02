//
//  ListOfMoviesViewController.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

protocol IListOfMoviesView: AnyObject {
	func update(movies: [MovieModel])
}

class ListOfMoviesViewController: UIViewController {
	var presenter: IListOfMoviesPresenter?
	var mainView = ListOfMovieView()

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter?.viewDidLoaded()
		view = mainView
		mainView.tableView.dataSource = self
	}	
}

extension ListOfMoviesViewController: IListOfMoviesView {
	func update(movies: [MovieModel]) {
		DispatchQueue.main.async{
			self.mainView.tableView.reloadData()
		}
	}
}

extension ListOfMoviesViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		presenter?.movieModels.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as! MovieViewCell
		let model = presenter?.movieModels[indexPath.row]
		cell.configureCell(model: model ?? MovieModel(title: "", overview: "", imageURL: ""))
		return cell
	}
}
