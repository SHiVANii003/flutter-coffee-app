import 'breakpoints.dart';
import 'device_type.dart';

class ResponsiveConfig {
  final DeviceType deviceType;
  final int columns;
  final double aspectRatio;
  final double maxWidth;

  const ResponsiveConfig({
    required this.deviceType,
    required this.columns,
    required this.aspectRatio,
    required this.maxWidth,
  });

  static ResponsiveConfig fromWidth(double width) {
    if (width < Breakpoints.mobile) {
      return const ResponsiveConfig(
        deviceType: DeviceType.mobile,
        columns: 2,
        aspectRatio: 0.66,
        maxWidth: double.infinity,
      );
    }

    if (width < Breakpoints.tablet) {
      return const ResponsiveConfig(
        deviceType: DeviceType.tablet,
        columns: 3,
        aspectRatio: 0.78,
        maxWidth: 900,
      );
    }

    return const ResponsiveConfig(
      deviceType: DeviceType.desktop,
      columns: 4,
      aspectRatio: 0.9,
      maxWidth: 1200,
    );
  }
}
