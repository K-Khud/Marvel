//
//  AuthorDetailsPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorDetailsPresenter
{
	func loadCreatorData() -> (Creator, UIImage?)
}

class CreatorDetailsPresenter: ICreatorDetailsPresenter
{
	weak var view: ICreatorDetailsViewController? //weak
	private var router: ICreatorDetailsRouter //strong
	private var repository: ICreatorDetailsRepository //strong

	init(repository: ICreatorDetailsRepository, router: ICreatorDetailsRouter) {
		self.router = router
		self.repository = repository
	}

	func loadCreatorData() -> (Creator, UIImage?) {
		return repository.getCreatorDetails()
	}
}
