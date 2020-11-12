//
//  APIRequest.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public protocol APIRequest: Encodable {
	// Response is wrapped into DataContainer
	associatedtype Response: Decodable

	// Last part of the URL
	var resourceName: String { get }
}
