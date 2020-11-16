//
//  AuthorDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorDetailsViewController: AnyObject
{
}

class CreatorDetailsViewController: DetailsViewControllerTemplate, ICreatorDetailsViewController, UITableViewDataSource
{
	private var presenter: ICreatorDetailsPresenter
	private var comicsArray = [ComicsItem]()


	init(presenter: ICreatorDetailsPresenter) {
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
		navigationController?.viewControllers.forEach({ (viewController) in
			viewController.navigationItem.backButtonTitle = "Creators"
			print(viewController.description)
		})
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
	}

	//MARK: - Load data method
	func loadData() {
		titleLabel.text = presenter.loadCreatorData().0.fullName
		image.image = presenter.loadCreatorData().1
		if let array = presenter.loadCreatorData().0.comics?.items {
			comicsArray = array
		}
		tableView.reloadData()
	}
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return comicsArray.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "comicsItemCell")
		if !comicsArray.isEmpty {
			let name = comicsArray[indexPath.row].name
			cell.textLabel?.text = name
		}
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return !comicsArray.isEmpty ? "Comics which feature work by this creator" : ""
	}
}
