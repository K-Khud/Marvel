//
//  AuthorsSearchRepository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 11.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
protocol ICreatorsSearchRepository
{
	func getCreators(with nameParameter: String?, completion: @escaping (Result<Creator, SearchError>) -> Void)
}

class CreatorsSearchRepository: ICreatorsSearchRepository
{
	private let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
											privateKey: MarvelKeys.privateKey.rawValue)

	public func getCreators(with nameParameter: String?,
							completion: @escaping (Result<Creator, SearchError>) -> Void) {
		apiClient.send(GetAuthors(nameStartsWith: nameParameter,
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
