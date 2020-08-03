import SwiftUI
import XCTest

@testable import ViewCollectionBuilders

final class ViewCollectionBuildersTests: XCTestCase {
  func testTaggedViewDictionaryBuilder() {
    func viewFn(@TaggedViewDictionaryBuilder<String> content: () -> [String: () -> AnyView]) {
      let processed = content()
      XCTAssertEqual(processed.keys.sorted(), ["Apple", "Ball", "Cat"])
    }
    viewFn {
      TaggedView("Cat") {
        Text("Cat")
      }
      TaggedView("Apple") {
        Text("Apple")
      }
      TaggedView("Ball") {
        Text("Ball")
      }
    }
  }

  func testCollectionViewBuilderMany() {
    func viewFn(@CollectionViewBuilder<Text> content: () -> [Text]) {
      let processed = content()
      XCTAssertEqual(processed, [Text("Apple"), Text("Ball"), Text("Cat")])
    }
    viewFn {
      Text("Apple")
      Text("Ball")
      Text("Cat")
    }
  }

  static var allTests = [
    ("testTaggedViewDictionaryBuilder", testTaggedViewDictionaryBuilder),
    ("testCollectionViewBuilderMany", testCollectionViewBuilderMany),
  ]

}
