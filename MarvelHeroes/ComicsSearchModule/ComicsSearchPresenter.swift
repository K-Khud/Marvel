//
//  ComicsSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IComicsSearchPresenter
{
}

class ComicsSearchPresenter: IComicsSearchPresenter
{
	weak var view: IComicsSearchViewController? //weak
	private var router: IComicsSearchRouter //strong
	private var repository: IComicsSearchRepository //strong

	init(repository: IComicsSearchRepository, router: IComicsSearchRouter) {
		self.router = router
		self.repository = repository
	}

}
