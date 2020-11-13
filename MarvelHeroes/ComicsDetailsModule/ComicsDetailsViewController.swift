//
//  ComicsDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsDetailsViewController: AnyObject
{
}

class ComicsDetailsViewController: DetailsViewControllerTemplate, IComicsDetailsViewController
{
	private var presenter: IComicsDetailPresenter

	init(presenter: IComicsDetailPresenter) {
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
		textLabel.text = presenter.loadComicsData().0.description
		titleLabel.text = presenter.loadComicsData().0.title
		image.image = presenter.loadComicsData().1
	}
}
