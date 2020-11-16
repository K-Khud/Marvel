//
//  DetailsCharacterViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 3.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IDetailsCharacterViewController: AnyObject
{
}

class DetailsCharacterViewController: DetailsViewControllerTemplate, IDetailsCharacterViewController, UITableViewDataSource
{

	private let presenter: IDetailCharacterPresenter

	private var comicItemsArray = [ComicsItem]()

	init(presenter: IDetailCharacterPresenter) {
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
		if let navigation = navigationController?.viewControllers[0] {
			navigation.navigationItem.backButtonTitle = "Heroes"
			navigation.view.backgroundColor = .clear
		}
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
	}

	//MARK: - Load data method
	private func loadData() {
		textLabel.text = presenter.loadCharacterData().0.description
		titleLabel.text = presenter.loadCharacterData().0.name
		image.image = presenter.loadCharacterData().1
		if let array = presenter.loadCharacterData().0.comics?.items {
			comicItemsArray = array
		}
		tableView.reloadData()
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return comicItemsArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "comicsItemCell")
		if !comicItemsArray.isEmpty {

			let name = comicItemsArray[indexPath.row].name

			cell.textLabel?.text = name
		}
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return !comicItemsArray.isEmpty ? "Comics which feature this character" : ""
	}
}
