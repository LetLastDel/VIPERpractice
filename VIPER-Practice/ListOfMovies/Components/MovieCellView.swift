//
//  MovieCellView.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 2.10.2023.
//

import Foundation
import UIKit

class MovieViewCell: UITableViewCell {
	
	static let reuseID = "MovieViewCell"
	let movieImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let movieName: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let movieDescription: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 12, weight: .regular, width: .standard)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setConstaints()
	}
	
	func setConstaints(){
		addSubview(movieImageView)
		addSubview(movieName)
		addSubview(movieDescription)
		
		NSLayoutConstraint.activate([
			movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
			movieImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
			movieImageView.heightAnchor.constraint(equalToConstant: 200),
			movieImageView.widthAnchor.constraint(equalToConstant: 100),
			movieImageView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12)])
		
		NSLayoutConstraint.activate([
			movieName.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 18),
			movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
			movieName.topAnchor.constraint(equalTo: movieImageView.topAnchor, constant: 24)])
		
		NSLayoutConstraint.activate([
			movieDescription.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20),
			movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
			movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
			movieDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
		])
	}
	
	func configureCell(model: MovieModel) {
		movieName.text = model.title
		movieDescription.text = model.overview
		movieImageView.image = model.image
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
