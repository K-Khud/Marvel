//
//  DetailContactPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 21.8.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

protocol IDetailContactPresenter
{
//	func showDetail(of index: Int)

	//TODO: present DetailsViewController

//	func loadInitialData()
}

class DetailCharacterPresenter
{
	weak var view: IDetailsCharacterViewController? //weak
	private var router: IDetailsCharacterRouter //strong
	private var repository: IDetailsCharacterRepository //strong

	init(repository: IDetailsCharacterRepository, router: IDetailsCharacterRouter) {
		self.router = router
		self.repository = repository
	}
}

extension CharactersSearchPresenter: IDetailContactPresenter
{

}
