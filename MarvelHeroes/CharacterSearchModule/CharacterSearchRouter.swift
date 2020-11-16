//
//  CharacterSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICharacterSearchRouter
{
	func showDetail(of character: Character, with image: UIImage?)
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
	func showDetail(of character: Character, with image: UIImage?) {
		let detailViewController = factory.getDetailsCharacterModule(character: character, image: image)
		viewController?.navigationController?.pushViewController(detailViewController,
																 animated: true)
	}
}
