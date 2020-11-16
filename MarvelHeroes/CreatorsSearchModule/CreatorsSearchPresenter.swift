//
//  AuthorsSearchPresenter.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICreatorsSearchPresenter
{
	func showDetail(of creator: Creator, with image: UIImage?)

	func loadCreators(with nameParameter: String?)
}

class CreatorsSearchPresenter: ICreatorsSearchPresenter
{
	weak var view: ICreatorsSearchViewController? //weak
	private var router: ICreatorsSearchRouter //strong
	private var repository: ICreatorsSearchRepository //strong

	private var loader = ImageLoader()
	private var imagesUrls = [URL]()

	init(repository: ICreatorsSearchRepository, router: ICreatorsSearchRouter) {
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

extension CreatorsSearchPresenter
{
	func loadCreators(with nameParameter: String?) {
		var creatorsArray = [Creator]()
		imagesUrls = []
		repository.getCreators(with: nameParameter) { result in

			let token = result.map({ author in

				DispatchQueue.main.async {
					if let newUrl = author.thumbnail?.url {
						self.imagesUrls.append(newUrl)
						self.loadImages()
					}
					creatorsArray.append(author)
					self.view?.show(creators: creatorsArray)
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

	func showDetail(of creator: Creator, with image: UIImage?) {
		router.showDetail(of: creator, with: image)
	}
}
