//
//  DerailsCharacterRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 4.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IDetailsCharacterRepository
{
	func getCharacterDetails() -> ComicCharacter
}

class DetailsCharacterRepository: IDetailsCharacterRepository
{

	private var character: ComicCharacter

	init(character: ComicCharacter) {
		self.character = character
	}

	func getCharacterDetails() -> ComicCharacter {
		return character
	}
}
