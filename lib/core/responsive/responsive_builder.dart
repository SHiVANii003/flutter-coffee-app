import 'package:flutter/widgets.dart';
import 'responsive_config.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ResponsiveConfig config) builder;

  const ResponsiveBuilder({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final config = ResponsiveConfig.fromWidth(constraints.maxWidth);
        return builder(context, config);
      },
    );
  }
}
