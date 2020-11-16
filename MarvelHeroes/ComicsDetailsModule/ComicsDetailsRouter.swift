//
//  ComicsDetailsRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

protocol IComicsDetailsRouter
{
}

class ComicsDetailsRouter: IComicsDetailsRouter
{
	weak var viewController: IComicsDetailsViewController?
	private var factory: ModulesFactory

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}
