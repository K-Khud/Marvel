//
//  AuthorDetailsPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IAuthorDetailPresenter
{
	func loadAuthorData() -> (Creator, UIImage?)
}

class CreatorDetailPresenter: IAuthorDetailPresenter
{
	weak var view: IAuthorDetailsViewController? //weak
	private var router: IAuthorDetailsRouter //strong
	private var repository: IAuthorDetailsRepository //strong

	init(repository: IAuthorDetailsRepository, router: IAuthorDetailsRouter) {
		self.router = router
		self.repository = repository
	}

	func loadAuthorData() -> (Creator, UIImage?) {
		return repository.getAuthorDetails()
	}
}
