//
//  DataContainer.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public struct DataContainer<Results: Decodable>: Decodable {
	public let offset: Int
	public let limit: Int
	public let total: Int
	public let count: Int
	public let results: Results
}
