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

	func show(url: URL)
}

class CharacterTableViewController: UITableViewController
{
	private var presenter: ICharacterSearchPresenter //strong
	
	private var charactersArray = [ComicCharacter]()
	private let imagePlaceholder = UIImage(named: "UIImage_1")


	private var imagesUrls = [URL]()
	private var loader = CharacterImageLoader()


	init(presenter: ICharacterSearchPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		presenter.loadInitialData()
		super.viewDidLoad()

		self.tableView.dataSource = self

		registerCells()
		setupNavigationTitle()
		setTableViewHeights()
	}

	private func setTableViewHeights() {
		tableView.estimatedSectionHeaderHeight = 120
		tableView.rowHeight = UITableView.automaticDimension

	}

	private func registerCells() {
		tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.register(CustomNavigationTitle.self, forHeaderFooterViewReuseIdentifier: "sectionHeader")

	}
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return charactersArray.count
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 80
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

		cell.accessoryType = .disclosureIndicator
		cell.imageView?.image = imagePlaceholder
		cell.imageView?.layer.masksToBounds = true
		cell.imageView?.layer.cornerRadius = 40

		if let text = charactersArray[indexPath.row].name {
			cell.textLabel?.text = text
			print(indexPath.row)
			cell.detailTextLabel?.text = charactersArray[indexPath.row].description
		let numberForImage = imagesUrls[indexPath.row]

			let _ = loader.loadImage(numberForImage) { result in
				do {
					let image = try result.get()
					DispatchQueue.main.async {
						cell.imageView?.image = image
						self.tableView.layoutSubviews()

					}
				} catch {
					print(error)
				}
			}
		}

		return cell
	}

	override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier:
					"sectionHeader") as? CustomNavigationTitle
		return headerView
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		presenter.showDetail(of: charactersArray[indexPath.row])
	}

	private func setupNavigationTitle() {
		self.navigationController?.navigationBar.barTintColor = UIColor(named: "headerColor")
	}
}

extension CharacterTableViewController: ICharacterView {
	func show(url: URL) {
		imagesUrls.append(url)
	}

	func show(heroes: [ComicCharacter]) {
		charactersArray = heroes
		tableView.reloadData()
	}
}
