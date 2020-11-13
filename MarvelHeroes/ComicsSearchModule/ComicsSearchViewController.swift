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

class ComicsSearchViewController: SearchViewControllerTemplate, UITableViewDataSource
{
	private var presenter: IComicsSearchPresenter //strong

	private var comicsArray = [Comic]()

	init(presenter: IComicsSearchPresenter) {
		self.presenter = presenter
		super.init()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		presenter.loadComics(with: nil)

		tableView.dataSource = self
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

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let image = tableView.cellForRow(at: indexPath)?.imageView?.image
		presenter.showDetail(of: comicsArray[indexPath.row], with: image)
	}
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

extension ComicsSearchViewController
{
	func textFieldDidEndEditing(_ textField: UITextField) {
		if let comics = textField.text {
			queryText = comics
			imagesDict.removeAll()
			presenter.loadComics(with: comics)
		} else {return}
	}
}
