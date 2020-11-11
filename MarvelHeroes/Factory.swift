//
//  Factory.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

class ModulesFactory {
	func getCharacterSearchModule() -> CharacterTableViewController {
		let repository = CharacterRepository()
		let router = CharacterRouter(factory: self)

		let presenter = CharactersSearchPresenter(repository: repository, router: router)
		let viewController = CharacterTableViewController(presenter: presenter)
		
		router.viewController = viewController
		presenter.view = viewController

		return viewController
	}

	func getDetailsCharacterModule(character: ComicCharacter) -> DetailsCharacterViewController {
		let router = DetailsCharacterRouter(factory: self)
		let repository = DetailsCharacterRepository(character: character)

		let presenter = DetailCharacterPresenter(repository: repository, router: router)
		let viewController = DetailsCharacterViewController(presenter: presenter)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}

	func getComicsSearchModule() -> ComicsSearchViewController {
		let repository = ComicsSearchRepository()
		let router = ComicsSearchRouter(factory: self)

		let presenter = ComicsSearchPresenter(repository: repository, router: router)
		let viewController = ComicsSearchViewController(presenter: presenter)

		router.viewController = viewController
		presenter.view = viewController

		return viewController
	}

	func getAuthorsSearchModule() -> AuthorsSearchViewController {
		let repository = AuthorsSearchRepository()
		let router = AuthorsSearchRouter(factory: self)

		let presenter = AuthorsSearchPresenter(repository: repository, router: router)
		let viewController = AuthorsSearchViewController(presenter: presenter)

		router.viewController = viewController
		presenter.view = viewController

		return viewController
	}



}
