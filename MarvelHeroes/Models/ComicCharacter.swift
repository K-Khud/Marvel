//
//  Character.swift
//  MarvelHeroes
//
//  Created by Ekaterina Koreneva on 04/12/2019.
//  Copyright © 2019 Ekaterina. All rights reserved.
//

import Foundation
import UIKit

public struct ComicCharacter: Decodable {
	public let id: Int
	public let name: String?
	public let description: String?
	public let thumbnail: Image?
}
