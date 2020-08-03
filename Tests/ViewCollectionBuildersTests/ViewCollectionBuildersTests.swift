import XCTest
@testable import ViewCollectionBuilders

final class ViewCollectionBuildersTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ViewCollectionBuilders().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
