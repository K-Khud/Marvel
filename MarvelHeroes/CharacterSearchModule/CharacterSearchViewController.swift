//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import UIKit

protocol ICharacterView: AnyObject
{
	func show(heroes: [ComicCharacter])
	func show(image: UIImage, for url: URL)
	func showStub()
}

class CharacterTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
	private var presenter: ICharacterSearchPresenter //strong
	
	private var charactersArray = [ComicCharacter]()
	private var imagesDict = [URL : UIImage]()
	private let tableView = UITableView()

	private var queryText: String = "" {
		didSet {
			dummy.label.text = "No matches for the query \"" + queryText + "\""
		}
	}
	private var dummy = DummyView(frame: .zero, queryText: "")


	init(presenter: ICharacterSearchPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		presenter.loadCharacters(with: nil)
		super.viewDidLoad()

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
		return headerView
	}
	//MARK: - TableView DataSource methods

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return charactersArray.count }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

		cell.accessoryType = .disclosureIndicator
		cell.imageView?.layer.masksToBounds = true
		cell.imageView?.layer.cornerRadius = 40

		if let name = charactersArray[indexPath.row].name, let details = charactersArray[indexPath.row].description, let url = charactersArray[indexPath.row].thumbnail?.url {
			cell.textLabel?.text = name
			cell.detailTextLabel?.text = details != "" ? details : ""
			cell.detailTextLabel?.textColor = .systemGray
			cell.detailTextLabel?.font = .systemFont(ofSize: 14)

			if let imageForCrop = imagesDict[url] {
				let cropSide = min(imageForCrop.size.width, imageForCrop.size.height)
				if let newImage = imageForCrop.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: cropSide, height: cropSide)) {
					cell.imageView?.image = UIImage(cgImage: (newImage))
				}
			}
		}
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let image = tableView.cellForRow(at: indexPath)?.imageView?.image
		presenter.showDetail(of: charactersArray[indexPath.row], with: image)
	}
}

extension CharacterTableViewController: ICharacterView
{
	func showStub() {
		dummy.isHidden = false
		charactersArray = []
		tableView.reloadData()
	}

	func show(image: UIImage, for url: URL) {
		imagesDict.updateValue(image, forKey: url)
		tableView.reloadData()
	}

	func show(heroes: [ComicCharacter]) {
		charactersArray = heroes
		dummy.isHidden = true
		tableView.reloadData()
	}
}
//MARK: - UITextFieldDelegate

extension CharacterTableViewController: UISearchTextFieldDelegate
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
		if let hero = textField.text {
			queryText = hero
			imagesDict.removeAll()
			presenter.loadCharacters(with: hero)
		} else {return}
	}
}
