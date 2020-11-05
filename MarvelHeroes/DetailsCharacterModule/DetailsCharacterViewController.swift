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

	let presenter: DetailCharacterPresenter

	var textLabel = UILabel()

	init(presenter: DetailCharacterPresenter) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)

		setupView()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupView() {
		textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
		textLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
		textLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
		textLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
		textLabel.translatesAutoresizingMaskIntoConstraints = false
		textLabel.backgroundColor = .blue
		textLabel.textColor = .magenta

	}
}

extension DetailsCharacterViewController: IDetailsCharacterViewController {

	func show(character: ComicCharacter) {
		textLabel.text = character.description
		updateViewConstraints()
	}
}
