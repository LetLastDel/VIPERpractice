//
//  DetailViewController.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit
/// Обновляет представление, после получения данных о  фильме
protocol IDetailView: AnyObject {
	func update(movies: DetailModel)
}

class DetailViewController: UIViewController {
	var presenter: IDetailPresenter?
	var mainView = DetailView()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view = mainView
		view.backgroundColor = .white
		presenter?.viewDidLoaded()
	}
}

extension DetailViewController: IDetailView {
	func update(movies: DetailModel) {
		mainView.titleLabel.text = movies.title
		mainView.descLabel.text = movies.overview
		mainView.imageView.image = movies.image
	}
}
