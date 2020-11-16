//
//  AuthorDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

/// Encodes any encodable to a URLQueryItem list
enum URLQueryItemEncoder
{
	static func encode<T: Encodable>(_ encodable: T) throws -> [URLQueryItem] {
		let parametersData = try JSONEncoder().encode(encodable)
		let parameters = try JSONDecoder().decode([String: HTTPParameter].self, from: parametersData)
		return parameters.map { URLQueryItem(name: $0, value: $1.description) }
	}
}
