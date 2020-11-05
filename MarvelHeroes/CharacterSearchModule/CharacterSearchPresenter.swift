//
//  CharacterSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

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
///Forward data to VC
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

//	func getCharacter(of index: Int) -> ComicCharacter {
//		return comicCharacters[index]
//	}
//
//	var charactersCount: Int {
//		return comicCharacters.count
//	}
//
	func showDetail(of character: ComicCharacter) {
		router.showDetail(with: character)
	}
}
