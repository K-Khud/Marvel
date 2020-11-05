//
//  CharacterSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

protocol ICharacterSearchRouter
{
	func showDetail(with character: ComicCharacter)
}

class CharacterRouter
{

	weak var viewController: CharacterTableViewController? //weak

	private var factory: ModulesFactory //STRONG!!! warning

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension CharacterRouter: ICharacterSearchRouter
{
	func showDetail(with character: ComicCharacter) {
		let detailViewController = factory.getDetailsCharacterModule(character: character)
		detailViewController.view.backgroundColor = .white
		viewController?.navigationController?.pushViewController(detailViewController,
																 animated: true)
	}
}
