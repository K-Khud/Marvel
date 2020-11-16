//
//  Characters.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
// MARK: - Characters
public struct Characters: Codable {
	public let available: Int
	public let collectionURI: String
	public let items: [Series]
	public let returned: Int
}

// MARK: - Series
public struct Series: Codable {
	public let resourceURI: String
	public let name: String
}
