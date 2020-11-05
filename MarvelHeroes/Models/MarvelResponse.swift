//
//  MarvelResponse.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public struct MarvelResponse<Response: Decodable>: Decodable {

	public let status: String?

	public let message: String?

	public let data: DataContainer<Response>?
}
