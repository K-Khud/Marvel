//
//  AuthorsSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IAuthorsSearchRouter
{
}

class AuthorsSearchRouter
{

	weak var viewController: IAuthorsSearchViewController? //weak

	private var factory: ModulesFactory //strong!!!! WARNING

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension AuthorsSearchRouter: IAuthorsSearchRouter
{
}
