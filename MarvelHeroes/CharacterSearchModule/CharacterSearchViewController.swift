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
	
	private var resultSearchController = UISearchController()
	private var charactersArray = [ComicCharacter]()

//	private var headerView: CustomNavigationTitle = {
//		let headerView = CustomNavigationTitle(with: 200)
//		return headerView
//	}()

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
		presenter.loadInitialData()
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.register(CustomNavigationTitle.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
		self.tableView.dataSource = self
		tableView.reloadData()

		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()

//		resultSearchController = ({
//			let controller = UISearchController(searchResultsController: nil)
//			controller.searchResultsUpdater = self as? UISearchResultsUpdating
//			controller.searchBar.sizeToFit()
//			tableView.tableHeaderView = controller.searchBar
//			return controller
//		})()


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

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
					"sectionHeader") as! CustomNavigationTitle

		return view


//		return setUpHeader()
	}
//	func setUpHeader() -> UIView {
//
//
//
//		let verticalStack = UIStackView(arrangedSubviews: [headerView, resultSearchController.searchBar])
//
//		return verticalStack
//	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.showDetail(of: charactersArray[indexPath.row])
	}
}

extension CharacterTableViewController: ICharacterView {
	func show(heroes: [ComicCharacter]) {
		charactersArray = heroes
		tableView.reloadData()
	}
}
