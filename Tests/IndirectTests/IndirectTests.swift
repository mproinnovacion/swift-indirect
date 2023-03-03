import XCTest
@testable import Indirect

struct Other: Equatable, Codable {
	@Indirect var number: Int
}

struct Other2: Equatable, Codable {
	var string: String
}


struct MyStruct: Equatable, Codable {
	@Indirect var name: String
	@Indirect var other: Other
	@Indirect var other2: Other2?
}

final class IndirectTests: XCTestCase {
	func testEquatable() {
		let value = MyStruct(
			name: "blah",
			other: Other(number: 7)
		)
		
		var value2 = value
		value2.name = "blih"
		
		XCTAssertNotEqual(value, value2)
		
		value2.name = "blah"
		
		XCTAssertEqual(value, value2)
	}
	
	func testCopyOnWrite() {
		let value = MyStruct(
			name: "blah",
			other: Other(number: 7)
		)
		
		var value2 = value
		
		value2.name = "blah2"
		
		XCTAssertEqual(value.name, "blah")
		XCTAssertEqual(value2.name, "blah2")
		
		value2.other.number = 1
		
		XCTAssertEqual(value.other.number, 7)
		XCTAssertEqual(value2.other.number, 1)
		
		value2.other = Other(number: 14)

		XCTAssertEqual(value.other.number, 7)
		XCTAssertEqual(value2.other.number, 14)
	}
	
	func testCodable() throws {
		let value = MyStruct(
			name: "blah",
			other: Other(number: 7),
			other2: Other2(string: "blih")
		)
		
		let data = try JSONEncoder().encode(value)
		let decoded = try JSONDecoder().decode(MyStruct.self, from: data)
		
		XCTAssertEqual(value, decoded)
		
		@Indirect var value2 = MyStruct(name: "blih", other: Other(number: 1))
		
		let data2 = try JSONEncoder().encode(value2)
		let decoded2 = try JSONDecoder().decode(MyStruct.self, from: data2)
		
		XCTAssertEqual(value2, decoded2)
	}
}
