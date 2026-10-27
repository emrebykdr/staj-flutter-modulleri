import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width < 600;

  static bool isTablet(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    return w >= 600 && w < 1024;
  }

  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 1024;

  static T value<T>(
    BuildContext ctx, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isDesktop(ctx)) return desktop;
    if (isTablet(ctx)) return tablet ?? mobile;
    return mobile;
  }
}

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      if (constraints.maxWidth >= 1024) return desktop;
      if (constraints.maxWidth >= 600) return tablet ?? mobile;
      return mobile;
    });
  }
}
