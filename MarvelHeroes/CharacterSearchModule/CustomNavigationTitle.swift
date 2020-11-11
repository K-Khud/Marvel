//
//  CustomNavigationTitle.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 5.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationTitle: UITableViewHeaderFooterView
{
	var searchBar: UISearchBar = {
		let bar = UISearchBar()
		bar.placeholder = "Search your hero"
		bar.backgroundColor = UIColor(named: "headerColor")
		bar.searchBarStyle = .minimal
		return bar
	}()


	private var title: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .boldSystemFont(ofSize: 32)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.text = "Heroes"
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()

	private var image: UIImageView = {
		let titleImageView = UIImageView(image: UIImage(named: "superhero"))
		titleImageView.contentMode = .scaleAspectFit
		return titleImageView
	}()


	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		configureContents()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configureContents() {
		image.translatesAutoresizingMaskIntoConstraints = false
		title.translatesAutoresizingMaskIntoConstraints = false
		searchBar.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(image)
		contentView.addSubview(title)
		contentView.backgroundColor = UIColor(named: "headerColor")
		contentView.addSubview(searchBar)


		NSLayoutConstraint.activate([
			image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			image.widthAnchor.constraint(equalToConstant: 70),
			image.heightAnchor.constraint(equalToConstant: 70),
			image.topAnchor.constraint(equalTo: contentView.topAnchor),

			title.heightAnchor.constraint(equalToConstant: 70),
			title.leadingAnchor.constraint(equalTo: image.trailingAnchor,
										   constant: 8),
			title.trailingAnchor.constraint(equalTo:
												contentView.layoutMarginsGuide.trailingAnchor),
			title.centerYAnchor.constraint(equalTo: image.centerYAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 120),

			searchBar.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
			searchBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
			searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
		])
	}
}
