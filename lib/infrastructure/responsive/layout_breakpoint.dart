enum LayoutBreakpoint {
  xs(480),
  sm(640),
  md(1080),
  lg(1200);

  const LayoutBreakpoint(this.breakPoint);
  final int breakPoint;
  
  T? mapBreakPoint<T>({T? xs, T? sm, T? md, T? lg}) {
    switch (this) {
      case LayoutBreakpoint.xs:
        return xs;
      case LayoutBreakpoint.sm:
        return sm;
      case LayoutBreakpoint.md:
        return md;
      case LayoutBreakpoint.lg:
        return lg;
      default:
        return null;
    }
  }
}