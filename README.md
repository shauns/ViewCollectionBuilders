# ViewCollectionBuilders

A set of useful building blocks to supplement `@ViewBuilder`.

## `CollectionViewBuilder<ViewType>`

This helps you write functions or Views that work with a collection of child views. You can then build your own functionality to e.g. selectively show or use the child views. The child views all need to share some underlying type.

```swift
struct UsesCollection : View {
  var content: [Text]
  @Binding var index: Int
  
  init(index: Binding<Int>, @CollectionViewBuilder<Text> _ content: () -> [Text]) {
    self._index = index
    self.content = content()
  }

  var body: some View {
    content[index]
  }
}

// renders "World"
UsesCollection(index: Binding.constant(1)) {
  Text("Hello")
  Text("World")
}
```

## `TaggedViewDictionaryBuilder<KeyType: Hashable>`

This helps you to write functions or views that use a mapping between some kind of tag, and underlying view functions. The `TaggedView` container must be used to wrap up the child views. The `.tag()` view modifier from SwiftUI is called on the child views as needed.

```swift
struct UsesMapping: View {
  var content: [String: () -> AnyView]
  @Binding var key: String
  
  init(key: Binding<String>, @TaggedViewDictionaryBuilder<String> _ content: () -> [String: () -> AnyView]) {
    self._key = key
    self.content = content()
  }
  
  var body: some View {
    content[key]()
  }
}

// renders AnotherView()
UsesMapping(key: Binding.constant("World")) {
  TaggedView("Hello") {
    SomeView()
  }
  TaggedView("World") {
    AnotherView()
  }
}

```

## Helpers

The `TaggedView` and `WithTag` containers help with pairing a tag to a view function, the main difference being that `WithTag` has strongly typed content, but `TaggedView` is agnostic and wraps things up in an `AnyView`. 
