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
}

class DetailsCharacterViewController: DetailsViewControllerTemplate
{

	private let presenter: IDetailCharacterPresenter



	init(presenter: IDetailCharacterPresenter) {
		self.presenter = presenter
		super.init()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		loadData()
	}


	//MARK: - Load data method
	func loadData() {
		textLabel.text = presenter.loadCharacterData().0.description
		titleLabel.text = presenter.loadCharacterData().0.name
		image.image = presenter.loadCharacterData().1
	}
}

extension DetailsCharacterViewController: IDetailsCharacterViewController
{
}
