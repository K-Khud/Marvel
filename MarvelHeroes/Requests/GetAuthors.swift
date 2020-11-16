//
//  GetAuthors.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 15.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation
public struct GetAuthors: APIRequest {
	public typealias Response = [Creator]

	public var resourceName: String {
		return "creators"
	}

	public let nameStartsWith: String?
	public let limit: Int?
	public let offset: Int?

	public init(nameStartsWith: String? = nil,
				limit: Int? = nil,
				offset: Int? = nil) {
		self.nameStartsWith = nameStartsWith
		self.limit = limit
		self.offset = offset
	}
}
