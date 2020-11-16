//
//  SearchTitleView.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

class SearchTitleView: UIView
{
	var title: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = UIFont(name: "Marvel-Regular", size: 46)
		label.numberOfLines = 0
		label.textColor = .white
		return label
	}()

	var searchBar: UISearchBar = {
		let bar = UISearchBar()
		bar.placeholder = "Search"
		bar.backgroundColor = UIColor(named: "headerColor")
		bar.searchBarStyle = .minimal
		return bar
	}()

	private var titleLabelView = UIView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		configureTitleLabel()
		configureTitleView()
		configureSearchBar()
		self.backgroundColor = UIColor(named: "headerColor")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func configureTitleView() {
		titleLabelView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(titleLabelView)

		titleLabelView.backgroundColor = UIColor(named: "marvelBackgroundColor")

		NSLayoutConstraint.activate([
			titleLabelView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			titleLabelView.trailingAnchor.constraint(equalTo:
												self.trailingAnchor)
		])
	}

	private func configureTitleLabel() {
		title.translatesAutoresizingMaskIntoConstraints = false
		titleLabelView.addSubview(title)
		NSLayoutConstraint.activate([
			title.leadingAnchor.constraint(equalTo: titleLabelView.leadingAnchor,
										   constant: 20),
			title.topAnchor.constraint(equalTo: titleLabelView.topAnchor, constant: 15),
			title.bottomAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: -10)
		])
	}

	private func configureSearchBar() {
		searchBar.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(searchBar)
		NSLayoutConstraint.activate([
			searchBar.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: 5),
			searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
			searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
			searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor)
		])
	}
}
