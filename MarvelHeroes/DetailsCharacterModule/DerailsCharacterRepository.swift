//
//  DerailsCharacterRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 4.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol IDetailsCharacterRepository
{
	func getCharacterDetails() -> (Character, UIImage?)
}

class DetailsCharacterRepository: IDetailsCharacterRepository
{

	private var character: Character
	private var image: UIImage?

	init(character: Character, image: UIImage?) {
		self.character = character
		self.image = image
	}

	func getCharacterDetails() -> (Character, UIImage?) {
		return (character, image)
	}
}
