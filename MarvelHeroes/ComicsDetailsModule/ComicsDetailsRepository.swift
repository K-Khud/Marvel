//
//  ComicsDetailsRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IComicsDetailsRepository
{
	func getComicsDetails() -> (Comic, UIImage?)
}

class ComicsDetailsRepository: IComicsDetailsRepository
{

	private var comics: Comic
	private var image: UIImage?

	init(comics: Comic, image: UIImage?) {
		self.comics = comics
		self.image = image
	}

	func getComicsDetails() -> (Comic, UIImage?) {
		return (comics, image)
	}
}
