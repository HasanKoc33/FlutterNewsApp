/// uygulama içindeki tüm paddinglerin tutulduğu enum
enum AppPadding {
  /// Padding 4
  s(4),

  /// Padding 8
  m(8),

  /// Padding 16
  l(14),

  /// Padding 32
  xl(18);

  const AppPadding(this.padding);

  /// enum değerininin double karşılığı
  final double padding;
}
