//
//  StoryCell.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

class StoryCell: UICollectionViewCell {
	static let reuseID = "StoryCell"
	let title = UILabel(frame: CGRect())
	let image = UIImageView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setViews()
		setConstraints()
	}
	
	func setViews() {
		title.numberOfLines = 0
		title.textColor = .black
		title.backgroundColor = UIColor(white: 1, alpha: 0.7)
		title.font = .boldSystemFont(ofSize: 15)
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		image.layer.cornerRadius = 15
	}
	
	func setConstraints(){
		addSubview(image)
		addSubview(title)
		image.translatesAutoresizingMaskIntoConstraints = false
		title.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			image.topAnchor.constraint(equalTo: topAnchor),
			image.bottomAnchor.constraint(equalTo: bottomAnchor),
			image.widthAnchor.constraint(equalToConstant: 200)])
		
		NSLayoutConstraint.activate([
			title.bottomAnchor.constraint(equalTo: bottomAnchor),
			title.leftAnchor.constraint(equalTo: image.leftAnchor),
			title.rightAnchor.constraint(equalTo: image.rightAnchor),
			title.widthAnchor.constraint(equalTo: image.widthAnchor)])
	}
	
	func configureCell(model: MovieModel) {
		title.text = model.title
		image.image = model.image
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
