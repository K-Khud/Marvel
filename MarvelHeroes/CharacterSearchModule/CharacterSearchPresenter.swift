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
	func showDetail(of character: ComicCharacter, with image: UIImage)

	func loadCharacters(with nameParameter: String?)
}

class CharactersSearchPresenter
{
	private var repository: ICharacterRepository //strong
	private var router: ICharacterSearchRouter //strong
	weak var view: ICharacterView? //weak
	private var loader = CharacterImageLoader()


	private var imagesUrls = [URL]()


	init(repository: ICharacterRepository, router: ICharacterSearchRouter) {
		self.repository = repository
		self.router = router
	}

	private func loadImages() {
		if let newUrl = imagesUrls.popLast() {
			let _ = loader.loadImage(newUrl) { result in
				do {
					let image = try result.get()
					DispatchQueue.main.async {
						self.view?.show(image: image, for: newUrl)
					}
				} catch {
					print(error)
				}
			}
		}
	}
}

extension CharactersSearchPresenter: ICharacterSearchPresenter
{
	func loadCharacters(with nameParameter: String?) {
		var charactersArray = [ComicCharacter]()
		imagesUrls = []
		repository.getCharacters(with: nameParameter) { result in

			let token = result.map({ comicCharacter in


				DispatchQueue.main.async {
					if let newUrl = comicCharacter.thumbnail?.url {
						self.imagesUrls.append(newUrl)
						self.loadImages()
					}
					charactersArray.append(comicCharacter)
					self.view?.show(heroes: charactersArray)
				}
			})
			do {
				try token.get()
			} catch {
				print(error)
				DispatchQueue.main.async {
					self.view?.showStub()
				}
			}
		}
	}

	func showDetail(of character: ComicCharacter, with image: UIImage) {
		router.showDetail(of: character, with: image)
	}
}
