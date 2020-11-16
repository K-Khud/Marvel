//
//  AuthorDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IAuthorDetailsViewController: AnyObject
{
}

class CreatorDetailsViewController: DetailsViewControllerTemplate, IAuthorDetailsViewController
{
	private var presenter: IAuthorDetailPresenter

	init(presenter: IAuthorDetailPresenter) {
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
//		textLabel.text = presenter.loadAuthorData().0
		titleLabel.text = presenter.loadAuthorData().0.fullName
		image.image = presenter.loadAuthorData().1
	}
}
