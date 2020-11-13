//
//  ComicsSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

protocol IComicsSearchRouter
{
}

class ComicsSearchRouter
{

	weak var viewController: IComicsSearchViewController? //weak

	private var factory: ModulesFactory //strong
	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension ComicsSearchRouter: IComicsSearchRouter
{
}
