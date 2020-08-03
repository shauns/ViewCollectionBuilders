import SwiftUI

/// Associates a view with a tag in a way that allows callers to get at the underlying tag value.
public struct TaggedView<TagType: Hashable> {
  var tag: TagType
  var getView: () -> AnyView

  public init<TaggedItem: View>(_ tag: TagType, @ViewBuilder _ content: @escaping () -> TaggedItem)
  {
    self.tag = tag
    self.getView = { () -> AnyView in
      AnyView(content().tag(tag))
    }
  }
}

/// Similar to `TaggedView`, but has a strongly typed content function
public struct WithTag<TagType: Hashable, Content: Any> {
  var tag: TagType
  var content: () -> Content

  init(_ tag: TagType, _ content: @escaping () -> Content) {
    self.tag = tag
    self.content = content
  }
}
