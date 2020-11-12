//
//  CharacterImageLoader.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 8.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICharacterImageLoader
{
	func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID?
	func cancelLoad(_ uuid: UUID)
}

class CharacterImageLoader: ICharacterImageLoader
{
	private var loadedImages = [URL: UIImage]()
	private var runningRequests = [UUID: URLSessionDataTask]()
	static let loader = CharacterImageLoader()

//MARK: - ICharacterImageLoader

	func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {
	  if let image = loadedImages[url] {
		completion(.success(image))
		return nil
	  }

	  let uuid = UUID()

	  let task = URLSession.shared.dataTask(with: url) { data, response, error in
		defer {self.runningRequests.removeValue(forKey: uuid) }

		if let data = data, let image = UIImage(data: data) {
		  self.loadedImages[url] = image
		  completion(.success(image))
		  return
		}

		guard let error = error else {return}

		guard (error as NSError).code == NSURLErrorCancelled else {
		  completion(.failure(error))
		  return
		}

	  }
	  task.resume()

	  runningRequests[uuid] = task
	  return uuid
	}

	func cancelLoad(_ uuid: UUID) {
	  runningRequests[uuid]?.cancel()
	  runningRequests.removeValue(forKey: uuid)
	}
}
