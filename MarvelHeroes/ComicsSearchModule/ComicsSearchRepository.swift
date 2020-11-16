//
//  ComicsSearchRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol IComicsSearchRepository
{
	func getComics(with nameParameter: String?, completion: @escaping (Result<Comic, SearchError>) -> Void)
}

class ComicsSearchRepository: IComicsSearchRepository
{
	private let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
									privateKey: MarvelKeys.privateKey.rawValue) 

	public func getComics(with nameParameter: String?, completion: @escaping (Result<Comic, SearchError>) -> Void) {

		apiClient.send(GetComics(title: nil,
								 titleStartsWith: nameParameter,
								 format: nil,
								 limit: nil,
								 offset: nil)) { response in

			_ = response.map { dataContainer in
				if dataContainer.results.isEmpty {
					completion(.failure(.noMatches))
				}
				for comics in dataContainer.results {
						completion(.success(comics))
				}
			}
		}
	}
}
