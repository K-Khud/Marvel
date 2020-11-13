//
//  DetailContactPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 21.8.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IDetailContactPresenter
{

	func loadCharacterData() -> (ComicCharacter, UIImage?)
}

class DetailCharacterPresenter: IDetailContactPresenter
{
	weak var view: IDetailsCharacterViewController? //weak
	private var router: IDetailsCharacterRouter //strong
	private var repository: IDetailsCharacterRepository //strong

	init(repository: IDetailsCharacterRepository, router: IDetailsCharacterRouter) {
		self.router = router
		self.repository = repository
	}

	func loadCharacterData() -> (ComicCharacter, UIImage?) {
		return repository.getCharacterDetails()
	}
}
