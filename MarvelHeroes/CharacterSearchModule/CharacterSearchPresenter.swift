//
//  CharacterSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICharacterSearchPresenter
{
	func showDetail(of character: ComicCharacter)

	func loadInitialData()

	func search(hero: String)
}

class CharactersSearchPresenter
{
	private var repository: ICharacterRepository //strong
	private var router: ICharacterSearchRouter //strong
	weak var view: ICharacterView? //weak

//	private var loader = CharacterImageLoader()

	init(repository: ICharacterRepository, router: ICharacterSearchRouter) {
		self.repository = repository
		self.router = router
	}
}

extension CharactersSearchPresenter: ICharacterSearchPresenter
{
	func loadInitialData() {
		var charactersArray = [ComicCharacter]()
		repository.getCharacters { result in
			_ = result.map({ comicCharacter in
				if let url = comicCharacter.thumbnail?.url {
					self.view?.show(url: url)
					print("Loading images from url, \(url)")
				}
				

				DispatchQueue.main.async {
					charactersArray.append(comicCharacter)
					self.view?.show(heroes: charactersArray)
				}
			})
		}
	}

	func search(hero: String) {
		//здесь будет новый request
	}

	func showDetail(of character: ComicCharacter) {
		router.showDetail(with: character)
	}
}
