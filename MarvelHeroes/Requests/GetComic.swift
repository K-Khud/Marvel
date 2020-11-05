import Foundation

public struct GetComic: APIRequest {
	public typealias Response = [Comic]

	public var resourceName: String {
		return "comics/\(comicId)"
	}

	// Parameters
	private let comicId: Int

	public init(comicId: Int) {
		self.comicId = comicId
	}
}
