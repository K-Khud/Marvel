//
//  Repository.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 03/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

protocol ICharacterRepository
{
	func getCharacters(with nameParameter: String?, completion: @escaping (Result<ComicCharacter, SearchError>) -> Void)
}
enum SearchError: Error {
	case noMatches
}

class CharacterRepository: ICharacterRepository
{
	private let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
									privateKey: MarvelKeys.privateKey.rawValue) //strong


	//getCharacters должен принимать в аргумент инициализацию структуры
	public func getCharacters(with nameParameter: String?, completion: @escaping (Result<ComicCharacter, SearchError>) -> Void) {

		apiClient.send(CharactersFromResponse(), nameParameter: nameParameter) { response in

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
