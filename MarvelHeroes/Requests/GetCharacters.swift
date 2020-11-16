//
//  AuthorDetailsViewController.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 16.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

public struct GetCharacters: APIRequest {
	public typealias Response = [Character]

	public var resourceName: String {
		return "characters"
	}

	public let name: String?
	public let nameStartsWith: String?
	public let limit: Int?
	public let offset: Int?

	public init(name: String? = nil,
	            nameStartsWith: String? = nil,
	            limit: Int? = nil,
	            offset: Int? = nil) {
		self.name = name
		self.nameStartsWith = nameStartsWith
		self.limit = limit
		self.offset = offset
	}
}
