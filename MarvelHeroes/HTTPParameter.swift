import Foundation

// Utility type so that we can decode any type of HTTP parameter
// Useful when we have mixed types in a HTTP request
enum MarvelKeys: String
{
	case publicKey = "19ccded4aa538a8bb903fcf67be61984"
	case privateKey = "be80d70f97e653dbc645c58fa87ede2689c26553"
}

enum HTTPParameter: CustomStringConvertible, Decodable
{
	case string(String)
	case bool(Bool)
	case int(Int)
	case double(Double)

	init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()

		if let string = try? container.decode(String.self) {
			self = .string(string)
		} else if let bool = try? container.decode(Bool.self) {
			self = .bool(bool)
		} else if let int = try? container.decode(Int.self) {
			self = .int(int)
		} else if let double = try? container.decode(Double.self) {
			self = .double(double)
		} else {
			throw MarvelError.decoding
		}
	}

	var description: String {
		switch self {
		case .string(let string):
			return string
		case .bool(let bool):
			return String(describing: bool)
		case .int(let int):
			return String(describing: int)
		case .double(let double):
			return String(describing: double)
		}
	}
}
