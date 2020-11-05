import Foundation

public struct CharactersFromResponse: APIRequest {
	public typealias Response = [ComicCharacter]

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
