//
//  Author.swift
//  MarvelHeroes
//
//  Created by Ekaterina Khudzhamkulova on 13.11.2020.
//  Copyright © 2020 Ekaterina. All rights reserved.
//

import Foundation

public struct Creator: Decodable {
	public let id: Int
	public let fullName: String?
	public let thumbnail: Image?
}
//comics (ComicList, optional): A resource list containing the comics which feature work by this creator.,
