//
//  AuthorDetailsRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IAuthorDetailsRouter
{
}

class CreatorDetailsRouter: IAuthorDetailsRouter
{

	weak var viewController: IAuthorDetailsViewController? //weak

	private var factory: ModulesFactory //strong!!!! WARNING

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}
