//
//  AuthorsSearchModule.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorsSearchViewController: AnyObject
{
	func show(creators: [Creator])
	func show(image: UIImage, for url: URL)
	func showStub()

}

class CreatorsSearchViewController: SearchViewControllerTemplate, UITableViewDataSource

{

	let presenter: ICreatorsSearchPresenter
	private var authorsArray = [Creator]()

	private var textLabel = UILabel()

	init(presenter: CreatorsSearchPresenter) {
		self.presenter = presenter
		super.init(categoryName: "Creators", reuseIdentifier: "creatorsCell")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.loadCreators(with: nil)
		tableView.dataSource = self
	}
	//MARK: - TableView DataSource methods

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return authorsArray.count }

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "authorsCell")

		if let name = authorsArray[indexPath.row].fullName {
			cell.textLabel?.text = name
			cell.accessoryType = .disclosureIndicator
			cell.imageView?.layer.masksToBounds = true
			cell.imageView?.layer.cornerRadius = 40

		}

		if let url = authorsArray[indexPath.row].thumbnail?.url {
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
		presenter.showDetail(of: authorsArray[indexPath.row], with: image)
	}
}

extension CreatorsSearchViewController: ICreatorsSearchViewController
{
	func showStub() {
		dummy.isHidden = false
		authorsArray.removeAll()
		tableView.reloadData()
	}

	func show(image: UIImage, for url: URL) {
		imagesDict.updateValue(image, forKey: url)
		tableView.reloadData()
	}

	func show(creators: [Creator]) {
		authorsArray = creators
		dummy.isHidden = true
		tableView.reloadData()
	}
}

//MARK: - UITextFieldDelegate

extension CreatorsSearchViewController
{
	func textFieldDidEndEditing(_ textField: UITextField) {
		if let authors = textField.text {
			queryText = authors
			imagesDict.removeAll()
			presenter.loadCreators(with: authors)
		} else {return}
	}
}
