//
//  SearchViewControllerTemplate.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

class SearchViewControllerTemplate: UIViewController, UITableViewDelegate
{
	var imagesDict = [URL : UIImage]()
	let tableView = UITableView()

	var categoryName: String?

	var queryText: String = "" {
		didSet {
			dummy.label.text = "No matches for the query \"" + queryText + "\""
		}
	}
	var dummy = EmptyView(frame: .zero, queryText: "")

	init(categoryName: String?) {
		super.init(nibName: nil, bundle: nil)
		self.categoryName = categoryName
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		tableView.delegate = self

		setupTableView()
		registerCells()
		setTableViewHeights()
		setUpDummyView()
	}

	private func setupTableView() {
		view.addSubview(tableView)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
	}

	private func setUpDummyView() {
		let bottomConstant = tabBarController?.tabBar.frame.height
		view.addSubview(dummy)
		dummy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120).isActive = true
		dummy.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: bottomConstant ?? 0).isActive = true
		dummy.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
		dummy.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
		dummy.isHidden = true
		dummy.translatesAutoresizingMaskIntoConstraints = false

	}
	//MARK: - TableView Layout methods

	private func setTableViewHeights() {
		tableView.estimatedSectionHeaderHeight = 120
		tableView.rowHeight = UITableView.automaticDimension
	}

	private func registerCells() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.register(CustomSectionTitle.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return 80}

	//MARK: - TableView Delegate methods

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 120
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
																	"sectionHeader") as? CustomSectionTitle
		headerView?.searchBar.searchTextField.delegate = self
		headerView?.title.text = categoryName
		return headerView
	}
}

//MARK: - UITextFieldDelegate

extension SearchViewControllerTemplate: UISearchTextFieldDelegate
{
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.endEditing(true)
		return true
	}

	func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
		if textField.text != "" {
			return true
		} else {
			return false
		}
	}
}
