//
//  APIRequest.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
	// Response будет завернут в DataContainer
	associatedtype Response: Decodable

	// Последняя часть URL
	var resourceName: String { get }
}
