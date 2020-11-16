//
//  Repository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

protocol ICharacterRepository
{
	func getCharacters(with nameParameter: String?, completion: @escaping (Result<Character, SearchError>) -> Void)
}

class CharacterRepository: ICharacterRepository
{
	private let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
									privateKey: MarvelKeys.privateKey.rawValue) //strong


	public func getCharacters(with nameParameter: String?, completion: @escaping (Result<Character, SearchError>) -> Void) {

		apiClient.send(GetCharacters(name: nil, nameStartsWith: nameParameter, limit: nil, offset: nil)) { response in

			_ = response.map { dataContainer in
				if dataContainer.results.isEmpty {
					completion(.failure(.noMatches))
				}
				for character in dataContainer.results {
						completion(.success(character))
				}
			}
		}
	}
}
