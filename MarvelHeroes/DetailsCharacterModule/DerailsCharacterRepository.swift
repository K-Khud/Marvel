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
	func getCharacterDetails() -> (ComicCharacter, UIImage)
}

class DetailsCharacterRepository: IDetailsCharacterRepository
{

	private var character: ComicCharacter
	private var image: UIImage

	init(character: ComicCharacter, image: UIImage) {
		self.character = character
		self.image = image
	}

	func getCharacterDetails() -> (ComicCharacter, UIImage) {
		return (character, image)
	}
}
