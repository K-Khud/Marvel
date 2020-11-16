//
//  Comics.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public struct Comic: Decodable {
	public let id: Int
	public let title: String?
	public let issueNumber: Double?
	public let description: String?
	public let pageCount: Int?
	public let thumbnail: Image?
	public let characters: Characters?
}
