/// Function builder that produces an array of a given type. This is useful where you wish to control the display or usage of children based on e.g. an index value.
@_functionBuilder
public struct CollectionViewBuilder<ViewType> {
  public static func buildBlock(_ children: ViewType...) -> [ViewType] {
    children
  }
}
