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
	func getCharacters(completion: @escaping (Result<ComicCharacter, Error>) -> Void)
}

class CharacterRepository: ICharacterRepository
{
	let apiClient = MarvelAPIClient(publicKey: MarvelKeys.publicKey.rawValue,
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

//	public func getCharacterDetail

//		// Новый request
//		apiClient.send(GetComics(titleStartsWith: "Avengers", format: .digital)) { response in
//			print("\nGetComics finished:")
//
//			do {
//				let dataContainer = try response.get()
//
//				for comic in dataContainer.results {
//					print("  Title: \(comic.title ?? "Unnamed comic")")
//					print("  Thumbnail: \(comic.thumbnail?.url.absoluteString ?? "None")")
//				}
//			} catch {
//				print(error)
//			}
//		}

		// Yet another request with a mandatory parameter
//		apiClient.send(GetComic(comicId: 61537)) { response in
//			print("\nGetComic finished:")
//
//			switch response {
//			case .success(let dataContainer):
//				let comic = dataContainer.results.first
//
//				print("  Title: \(comic?.title ?? "Unnamed comic")")
//				print("  Thumbnail: \(comic?.thumbnail?.url.absoluteString ?? "None")")
//			case .failure(let error):
//				print(error)
//			}
//		}
}
