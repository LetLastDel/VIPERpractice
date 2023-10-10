//
//  ListOfMovieView.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

class MovieListView: UIView {
	let title = UILabel()
	let tableView = UITableView()
	
	init() {
		super.init(frame: CGRect())
		backgroundColor = .white
		setView()
		setConstraints()
	}
	
	func setView(){
		tableView.register(MovieViewCell.self, forCellReuseIdentifier: "MovieViewCell")
		title.text = "New"
		title.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
	}
	
	func setConstraints(){
		addSubview(title)
		title.translatesAutoresizingMaskIntoConstraints = false
		addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			title.rightAnchor.constraint(equalTo: rightAnchor),
			title.heightAnchor.constraint(equalToConstant: 40)])
		
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: title.topAnchor, constant: 35),
			tableView.leftAnchor.constraint(equalTo: leftAnchor),
			tableView.rightAnchor.constraint(equalTo: rightAnchor),
			tableView.bottomAnchor.constraint(equalTo: bottomAnchor)])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
