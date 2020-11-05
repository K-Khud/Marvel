//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import UIKit

protocol ICharacterView: AnyObject {
	func show(heroes: [ComicCharacter])
}

class CharacterTableViewController: UITableViewController
{
	private var presenter: ICharacterSearchPresenter //strong
	
	var resultSearchController = UISearchController()
	var charactersArray = [ComicCharacter]()
//	var headerView: CustomHeaderView
//	var headerHeightConstraint: NSLayoutConstraint

	init(presenter: ICharacterSearchPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		setUpHeader()
		resultSearchController = ({
			let controller = UISearchController(searchResultsController: nil)
			controller.searchResultsUpdater = self as? UISearchResultsUpdating
			controller.dimsBackgroundDuringPresentation = false
			controller.searchBar.sizeToFit()
			tableView.tableHeaderView = controller.searchBar
			return controller
		})()
		presenter.loadInitialData()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		self.tableView.dataSource = self
		tableView.reloadData()
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return charactersArray.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = charactersArray[indexPath.row].name
//		cell.imageView?.image = charactersArray[indexPath.row].thumbnail
//		cell.detailTextLabel?.text = charactersArray[indexPath.row].description
		return cell
	}

//	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//		return CustomHeaderView(withWidth: 200, titleText: "Heroes", descriptionText: nil)
//	}

	func setUpHeader() {
		self.title = "Heroes"
	}
}

extension CharacterTableViewController: ICharacterView {
	func show(heroes: [ComicCharacter]) {
		charactersArray = heroes
		tableView.reloadData()
	}
}
