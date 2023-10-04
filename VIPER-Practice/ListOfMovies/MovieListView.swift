//
//  ListOfMovieView.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

class MovieListView: UIView {
	let tableView = UITableView()
	
	init() {
		super.init(frame: CGRect())
		backgroundColor = .white
		setView()
		setConstraints()
	}
	///Настраиваем таблицу, а в данном случае регистрируем ячейку в таблице
	func setView(){
		tableView.register(MovieViewCell.self, forCellReuseIdentifier: "MovieViewCell")
	}
	/// Задаем констрейты для представления
	func setConstraints(){
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			tableView.leftAnchor.constraint(equalTo: leftAnchor),
			tableView.rightAnchor.constraint(equalTo: rightAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
