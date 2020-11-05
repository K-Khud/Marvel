//
//  MarvelError.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation

public enum MarvelError: Error {
	case encoding
	case decoding
	case server(message: String)
}
