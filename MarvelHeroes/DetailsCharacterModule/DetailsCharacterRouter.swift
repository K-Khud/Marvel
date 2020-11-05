//
//  DetailsCharacterRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 4.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

protocol IDetailsCharacterRouter
{
//	func showDetail(with character: ComicCharacter)
}

class DetailsCharacterRouter
{

	weak var viewController: DetailsCharacterViewController? //weak

	private weak var factory: ModulesFactory? //weak

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension DetailsCharacterRouter: IDetailsCharacterRouter
{
//	func showDetail(with character: ComicCharacter) {
//		if let detailViewController = factory.getDetailsModule(character: ComicCharacter) {
//		detailViewController.view.backgroundColor = .white
//		viewController?.navigationController?.pushViewController(detailViewController,
//																 animated: true)
//		}
//	}
}
