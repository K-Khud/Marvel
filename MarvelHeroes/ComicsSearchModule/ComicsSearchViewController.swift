//
//  ComicsSearchModule.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsSearchViewController: AnyObject
{
	func show(comics: [Comic])
	func show(image: UIImage, for url: URL)
	func showStub()
}

class ComicsSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	private var presenter: IComicsSearchPresenter //strong

	private var comicsArray = [Comic]()
	private var imagesDict = [URL : UIImage]()
	private let tableView = UITableView()

	private var queryText: String = "" {
		didSet {
			dummy.label.text = "No matches for the query \"" + queryText + "\""
		}
	}
	private var dummy = DummyView(frame: .zero, queryText: "")

	init(presenter: IComicsSearchPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.loadComics(with: nil)

		tableView.dataSource = self
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
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "comicsCell")
		tableView.register(CustomSectionTitle.self, forHeaderFooterViewReuseIdentifier: "comicsSectionHeader")
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {return 80}

	//MARK: - TableView Delegate methods

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 120
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
																	"comicsSectionHeader") as? CustomSectionTitle
		headerView?.searchBar.searchTextField.delegate = self
		headerView?.title.text = "Comics"
		return headerView
	}
	//MARK: - TableView DataSource methods

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { print(comicsArray.count); return comicsArray.count }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "comicsCell")

		if let name = comicsArray[indexPath.row].title {
			cell.textLabel?.text = name
			cell.accessoryType = .disclosureIndicator
			cell.imageView?.layer.masksToBounds = true
			cell.imageView?.layer.cornerRadius = 40

		}
		if let details = comicsArray[indexPath.row].description {
			cell.detailTextLabel?.text = details != "" ? details : ""
			cell.detailTextLabel?.textColor = .systemGray
			cell.detailTextLabel?.font = .systemFont(ofSize: 14)

		}
		if let url = comicsArray[indexPath.row].thumbnail?.url {
			if let imageForCrop = imagesDict[url] {
				let cropSide = min(imageForCrop.size.width, imageForCrop.size.height)
				if let newImage = imageForCrop.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: cropSide, height: cropSide)) {
					cell.imageView?.image = UIImage(cgImage: (newImage))
				}
			}
		}
		return cell
	}

//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		let image = tableView.cellForRow(at: indexPath)?.imageView?.image
//		presenter.showDetail(of: comicsArray[indexPath.row], with: image)
//	}
}

extension ComicsSearchViewController: IComicsSearchViewController
{
	func showStub() {
		dummy.isHidden = false
		comicsArray.removeAll()
		tableView.reloadData()
	}

	func show(image: UIImage, for url: URL) {
		imagesDict.updateValue(image, forKey: url)
		tableView.reloadData()
	}

	func show(comics: [Comic]) {
		comicsArray = comics
		dummy.isHidden = true
		tableView.reloadData()
	}
}
//MARK: - UITextFieldDelegate

extension ComicsSearchViewController: UISearchTextFieldDelegate
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

	func textFieldDidEndEditing(_ textField: UITextField) {
		if let comics = textField.text {
			queryText = comics
			imagesDict.removeAll()
			presenter.loadComics(with: comics)
		} else {return}
	}
}
