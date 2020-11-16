//
//  AuthorDetailsRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IAuthorDetailsRepository
{
	func getAuthorDetails() -> (Creator, UIImage?)
}

class CreatorDetailsRepository: IAuthorDetailsRepository
{

	private var author: Creator
	private var image: UIImage?

	init(author: Creator, image: UIImage?) {
		self.author = author
		self.image = image
	}

	func getAuthorDetails() -> (Creator, UIImage?) {
		return (author, image)
	}
}
