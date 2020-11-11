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
	func getCharacters(completion: @escaping (Result<ComicCharacter, Error>) -> Void)
}

class CharacterRepository: ICharacterRepository
{
	private let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
									privateKey: MarvelKeys.privateKey.rawValue) //strong


	//getCharacters должен принимать в аргумент инициализацию структуры
	public func getCharacters(completion: @escaping (Result<ComicCharacter, Error>) -> Void) {

		// Запрос без параметров
		//response содержит dataConteiner'ы
		//в качестве аргумента send принимает инициализацию структуры GetCharacters
		apiClient.send(CharactersFromResponse()) { response in

			_ = response.map { dataContainer in
				for character in dataContainer.results {
						completion(.success(character))

					print("  Title: \(character.name ?? "Unnamed character")")
					print("  Thumbnail: \(character.thumbnail?.url.absoluteString ?? "None")")
				}
			}
		}
	}
}
