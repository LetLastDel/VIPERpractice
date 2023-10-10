//
//  PopularMoviesView.swift
//  VIPER-Practice
//
//  Created by A.Stelmakh on 6.10.2023.
//

import Foundation
import UIKit

class PopularMoviesView: UIView {
	var collectionView: UICollectionView!
	let scrollView = UICollectionViewFlowLayout()
	let title = UILabel()
	
	init(){
		super.init(frame: CGRect())
		backgroundColor = .white
		setViews()
		setConstraints()
	}
	
	func setViews() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.itemSize = CGSize(width: 100, height: 100)
		layout.minimumLineSpacing = 110
		layout.minimumInteritemSpacing = 1000
		title.text = "Popular"
		title.font = .systemFont(ofSize: 32, weight: .bold, width: .condensed)
		collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.reuseID)
		collectionView.backgroundColor = .clear
		collectionView.showsHorizontalScrollIndicator = false
	}
	
	func setConstraints() {
		addSubview(title)
		addSubview(collectionView)
		title.translatesAutoresizingMaskIntoConstraints = false
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			title.rightAnchor.constraint(equalTo: rightAnchor),
			title.heightAnchor.constraint(equalToConstant: 100)])
		
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
			collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
			collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: 10)])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

