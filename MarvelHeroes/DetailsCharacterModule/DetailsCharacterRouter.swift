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
}

class DetailsCharacterRouter: IDetailsCharacterRouter
{

	weak var viewController: IDetailsCharacterViewController? //weak

	private var factory: ModulesFactory //strong!!!! WARNING

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}
