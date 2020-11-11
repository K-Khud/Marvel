//
//  AuthorsSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IAuthorsSearchPresenter
{
}

class AuthorsSearchPresenter: IAuthorsSearchPresenter
{
	weak var view: IAuthorsSearchViewController? //weak
	private var router: IAuthorsSearchRouter //strong
	private var repository: IAuthorsSearchRepository //strong

	init(repository: IAuthorsSearchRepository, router: IAuthorsSearchRouter) {
		self.router = router
		self.repository = repository
	}

}
