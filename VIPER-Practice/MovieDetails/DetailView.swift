//
//  DetailView.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 3.10.2023.
//

import Foundation
import UIKit

class DetailView: UIView {
	let imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let descLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 2
		label.font = .systemFont(ofSize: 12, weight: .bold, width: .condensed)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	init(){
		super.init(frame: CGRect())
		setConstraints()
	}
	
	func setConstraints(){
		addSubview(imageView)
		addSubview(titleLabel)
		addSubview(descLabel)
		
		NSLayoutConstraint.activate([
			imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			imageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
			imageView.heightAnchor.constraint(equalToConstant: 200),
			imageView.widthAnchor.constraint(equalToConstant: 300)
		])
		
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20)
		])
		
		NSLayoutConstraint.activate([
			descLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			descLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
			descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
