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

	private var seriesArray = [CharacterList]()

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
		configureNavigationBar()
		loadData()
	}

	private func configureNavigationBar() {
		if let navigation = navigationController?.viewControllers[1] {
			navigation.navigationItem.backButtonTitle = "Comics"
			navigation.view.backgroundColor = .clear
		}
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
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
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "charactersItemCell")
		if !seriesArray.isEmpty {

			let name = seriesArray[indexPath.row].name
//			let url = seriesArray[indexPath.row].resourceURI

			cell.textLabel?.text = name
		}
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return !seriesArray.isEmpty ? "Characters which appear in this comic" : ""
	}

}
