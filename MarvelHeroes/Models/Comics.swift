//
//  Comics.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

public struct Comics: Codable {
	public let available: Int
	public let collectionURI: String
	public let items: [ComicsItem]
	public let returned: Int
}

// MARK: - ComicsItem
public struct ComicsItem: Codable {
	public let resourceURI: String
	public let name: String
}
