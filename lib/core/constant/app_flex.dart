/// AppFlex
enum AppFlex {
  /// Flex 1
  s(1),

  /// Flex 2
  m(2),

  /// Flex 3
  l(3),

  /// Flex 4
  xl(4);

  const AppFlex(this.flex);

  /// enum değerininin int karşılığı
  final int flex;
}
