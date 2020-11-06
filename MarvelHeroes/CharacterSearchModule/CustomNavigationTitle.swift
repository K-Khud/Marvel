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
	var resultSearchController: UISearchController = {
		let controller = UISearchController(searchResultsController: nil)
		controller.searchResultsUpdater = self as? UISearchResultsUpdating
		controller.searchBar.sizeToFit()
		controller.searchBar.backgroundImage = UIImage()
		return controller
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

	func configureContents() {
		image.translatesAutoresizingMaskIntoConstraints = false
		title.translatesAutoresizingMaskIntoConstraints = false
		resultSearchController.searchBar.translatesAutoresizingMaskIntoConstraints = false

		contentView.addSubview(image)
		contentView.addSubview(title)
		contentView.backgroundColor = UIColor(named: "headerColor")
		contentView.addSubview(resultSearchController.searchBar)


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

			resultSearchController.searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
			resultSearchController.searchBar.centerXAnchor.constraint(equalTo: contentView.centerXAnchor,
																  constant: 5),
			resultSearchController.searchBar.topAnchor.constraint(equalTo: image.bottomAnchor)


		])
	}
}
