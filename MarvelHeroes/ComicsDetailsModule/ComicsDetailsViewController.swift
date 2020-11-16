//
//  ComicsDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsDetailsViewController: AnyObject
{
}

class ComicsDetailsViewController: DetailsViewControllerTemplate, IComicsDetailsViewController, UITableViewDataSource
{
	private var presenter: IComicsDetailPresenter

	private var seriesArray = [Series]()


	init(presenter: IComicsDetailPresenter) {
		self.presenter = presenter
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self

		loadData()
	}

	//MARK: - Load data method
	func loadData() {
		textLabel.text = presenter.loadComicsData().0.description
		titleLabel.text = presenter.loadComicsData().0.title
		image.image = presenter.loadComicsData().1
		if let array = presenter.loadComicsData().0.characters?.items {
			seriesArray = array
		}
		tableView.reloadData()
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return seriesArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "seriesItemCell")
		if !seriesArray.isEmpty {

			let name = seriesArray[indexPath.row].name
			let url = seriesArray[indexPath.row].resourceURI
			print(url)

			cell.textLabel?.text = name
		}
		return cell
	}
}
