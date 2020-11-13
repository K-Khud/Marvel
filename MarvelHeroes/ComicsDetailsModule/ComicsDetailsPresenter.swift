//
//  ComicsDetailsPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsDetailPresenter
{
	func loadComicsData() -> (Comic, UIImage?)
}

class ComicsDetailPresenter: IComicsDetailPresenter
{
	weak var view: IComicsDetailsViewController? //weak
	private var router: IComicsDetailsRouter //strong
	private var repository: IComicsDetailsRepository //strong

	init(repository: IComicsDetailsRepository, router: IComicsDetailsRouter) {
		self.router = router
		self.repository = repository
	}

	func loadComicsData() -> (Comic, UIImage?) {
		return repository.getComicsDetails()
	}
}
