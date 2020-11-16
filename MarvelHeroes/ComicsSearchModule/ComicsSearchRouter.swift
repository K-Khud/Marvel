//
//  ComicsSearchRouter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsSearchRouter
{
	func showDetail(of comics: Comic, with image: UIImage?)
}

class ComicsSearchRouter
{
	weak var viewController: ComicsSearchViewController?

	private var factory: ModulesFactory 
	init(factory: ModulesFactory) {
		self.factory = factory
	}
}

extension ComicsSearchRouter: IComicsSearchRouter
{
	func showDetail(of comics: Comic, with image: UIImage?) {
		let detailsViewController = factory.getComicsDetailsModule(comics: comics, image: image)
		viewController?.navigationController?.pushViewController(detailsViewController,
																 animated: true)
	}
}
