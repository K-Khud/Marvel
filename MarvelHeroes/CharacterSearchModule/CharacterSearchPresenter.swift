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

//	func showImage(from url: URL) -> UIImage //TODO

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
//	func showImage(from url: URL) -> UIImage {
//		let image = repository.getImage(from: url)
//		return image
//	}


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

//	private func loadImages(from imageUrl: URL) {
//	}


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
