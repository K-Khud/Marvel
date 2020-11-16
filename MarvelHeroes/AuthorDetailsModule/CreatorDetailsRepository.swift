//
//  AuthorDetailsRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorDetailsRepository
{
	func getCreatorDetails() -> (Creator, UIImage?)
}

class CreatorDetailsRepository: ICreatorDetailsRepository
{

	private var creator: Creator
	private var image: UIImage?

	init(creator: Creator, image: UIImage?) {
		self.creator = creator
		self.image = image
	}

	func getCreatorDetails() -> (Creator, UIImage?) {
		return (creator, image)
	}
}
