import SwiftUI

/// Function builder that produces a dictionary of a tag value to a view builder function. This is a useful building block for other views that may want to programmatically control the display or usage of child views. This requires that child views are wrapped in the `TaggedView` container.
@_functionBuilder
public struct TaggedViewDictionaryBuilder<KeyType: Hashable> {
  public static func buildBlock(_ children: TaggedView<KeyType>...) -> [KeyType: () -> AnyView] {
    return Dictionary(
      uniqueKeysWithValues: children.map {
        ($0.tag, $0.getView)
      })
  }
}
