//
//  Factory.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

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

	func getDetailsCharacterModule(character: Character, image: UIImage?) -> DetailsCharacterViewController {
		let router = DetailsCharacterRouter(factory: self)
		let repository = DetailsCharacterRepository(character: character, image: image)

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

	func getComicsDetailsModule(comics: Comic, image: UIImage?) -> ComicsDetailsViewController {
		let router = ComicsDetailsRouter(factory: self)
		let repository = ComicsDetailsRepository(comics: comics, image: image)

		let presenter = ComicsDetailPresenter(repository: repository, router: router)
		let viewController = ComicsDetailsViewController(presenter: presenter)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}

	func getCreatorsSearchModule() -> CreatorsSearchViewController {
		let repository = CreatorsSearchRepository()
		let router = CreatorsSearchRouter(factory: self)

		let presenter = CreatorsSearchPresenter(repository: repository, router: router)
		let viewController = CreatorsSearchViewController(presenter: presenter)

		router.viewController = viewController
		presenter.view = viewController

		return viewController
	}

	func getCreatorDetailsModule(creator: Creator, image: UIImage?) -> CreatorDetailsViewController {
		let router = CreatorDetailsRouter(factory: self)
		let repository = CreatorDetailsRepository(creator: creator, image: image)

		let presenter = CreatorDetailsPresenter(repository: repository, router: router)
		let viewController = CreatorDetailsViewController(presenter: presenter)

		presenter.view = viewController
		router.viewController = viewController

		return viewController
	}
}
