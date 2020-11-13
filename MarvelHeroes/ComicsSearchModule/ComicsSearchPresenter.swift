//
//  ComicsSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IComicsSearchPresenter
{
//	func showDetail(of comic: ComicCharacter, with image: UIImage?)

	func loadComics(with nameParameter: String?)

}

class ComicsSearchPresenter
{
	weak var view: IComicsSearchViewController? //weak
	private var router: IComicsSearchRouter //strong
	private var repository: IComicsSearchRepository //strong

	private var loader = ImageLoader()
	private var imagesUrls = [URL]()

	init(repository: IComicsSearchRepository, router: IComicsSearchRouter) {
		self.router = router
		self.repository = repository
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

extension ComicsSearchPresenter: IComicsSearchPresenter
{
	func loadComics(with nameParameter: String?) {
		var comicsArray = [Comic]()
		imagesUrls = []
		repository.getComics(with: nameParameter) { result in

			let token = result.map({ comics in

				DispatchQueue.main.async {
					if let newUrl = comics.thumbnail?.url {
						self.imagesUrls.append(newUrl)
						self.loadImages()
					}
					comicsArray.append(comics)
					self.view?.show(comics: comicsArray)
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

//	func showDetail(of character: ComicCharacter, with image: UIImage?) {
//		router.showDetail(of: character, with: image)
//	}

}
