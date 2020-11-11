//
//  CharacterImageLoader.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 8.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICharacterImageLoader {
	func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID?
	func cancelLoad(_ uuid: UUID)
}

class CharacterImageLoader: ICharacterImageLoader {
	private var loadedImages = [URL: UIImage]()
	private var runningRequests = [UUID: URLSessionDataTask]()
	static let loader = CharacterImageLoader()

//MARK: - ICharacterImageLoader

	func loadImage(_ url: URL, _ completion: @escaping (Result<UIImage, Error>) -> Void) -> UUID? {

	  // 1
	  if let image = loadedImages[url] {
		completion(.success(image))
		return nil
	  }

	  // 2
	  let uuid = UUID()

	  let task = URLSession.shared.dataTask(with: url) { data, response, error in
		// 3
		defer {self.runningRequests.removeValue(forKey: uuid) }

		// 4
		if let data = data, let image = UIImage(data: data) {
		  self.loadedImages[url] = image
		  completion(.success(image))
		  return
		}

		// 5
		guard let error = error else {
		  // without an image or an error, we'll just ignore this for now
		  // you could add your own special error cases for this scenario
		  return
		}

		guard (error as NSError).code == NSURLErrorCancelled else {
		  completion(.failure(error))
		  return
		}

		// the request was cancelled, no need to call the callback
	  }
	  task.resume()

	  // 6
	  runningRequests[uuid] = task
	  return uuid
	}

	func cancelLoad(_ uuid: UUID) {
	  runningRequests[uuid]?.cancel()
	  runningRequests.removeValue(forKey: uuid)
	}
}
