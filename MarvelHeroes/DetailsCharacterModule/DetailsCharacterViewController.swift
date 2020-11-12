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
	func show(character: ComicCharacter)
}

class DetailsCharacterViewController: UIViewController {

	private let presenter: DetailCharacterPresenter

	private var textLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .systemFont(ofSize: 20)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()
	private var titleLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .left
		label.font = .boldSystemFont(ofSize: 32)
		label.numberOfLines = 0
		label.backgroundColor = .clear
		label.textColor = UIColor(named: "headerTitleColor")
		return label
	}()


	private var image: UIImageView = {
		let backImageView = UIImageView(image: UIImage(named: "UIImage_1"))
		backImageView.contentMode = .scaleToFill
		return backImageView
	}()

	init(presenter: DetailCharacterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		loadData()
		setupTitleLabel()
		setupLabel()
	}


	func loadData() {
		textLabel.text = presenter.loadCharacterData().description
		titleLabel.text = presenter.loadCharacterData().name
	}

	func setupTitleLabel() {
		view.addSubview(titleLabel)
		titleLabel.translatesAutoresizingMaskIntoConstraints = false

		titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
		titleLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
		titleLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
	}

	func setupLabel() {
		view.addSubview(textLabel)
		textLabel.translatesAutoresizingMaskIntoConstraints = false

		textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
		textLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
		textLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
	}
}

extension DetailsCharacterViewController: IDetailsCharacterViewController
{
	func show(character: ComicCharacter) {
		titleLabel.text = character.name
		textLabel.text = character.description

		updateViewConstraints()
	}
}
