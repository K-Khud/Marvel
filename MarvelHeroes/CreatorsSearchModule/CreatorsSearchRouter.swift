//
//  AuthorsSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorsSearchRouter
{
	func showDetail(of creator: Creator, with image: UIImage?)
}

class CreatorsSearchRouter
{

	weak var viewController: CreatorsSearchViewController? //weak

	private var factory: ModulesFactory //strong!!!! WARNING

	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension CreatorsSearchRouter: ICreatorsSearchRouter
{
	func showDetail(of creator: Creator, with image: UIImage?) {
		let detailsViewController = factory.getCreatorDetailsModule(creator: creator, image: image)
		viewController?.navigationController?.pushViewController(detailsViewController,
																 animated: true)
	}
}
