import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Figma reference dimensions
const double _figmaDesignWidth = 375;
const double _figmaDesignHeight = 812;
const double _figmaStatusBar = 0;

/// Device breakpoints
enum DeviceType { mobile, tablet, desktop }

class ResponsiveHelper {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double devicePixelRatio;
  static late DeviceType deviceType;

  /// Initializes the helper. Wrap your app with [ResponsiveWrapper].
  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    devicePixelRatio = _mediaQueryData.devicePixelRatio;

    if (screenWidth >= 1024) {
      deviceType = DeviceType.desktop;
    } else if (screenWidth >= 768) {
      deviceType = DeviceType.tablet;
    } else {
      deviceType = DeviceType.mobile;
    }
  }

  /// Width scaling from Figma design
  static double setWidth(num width) =>
      (width / _figmaDesignWidth) * screenWidth;

  /// Height scaling from Figma design
  static double setHeight(num height) =>
      (height / (_figmaDesignHeight - _figmaStatusBar)) * screenHeight;

  /// Font scaling from Figma design using shortest side
  static double setSp(num fontSize) {
    final scale = math.min(
      screenWidth / _figmaDesignWidth,
      screenHeight / _figmaDesignHeight,
    );
    return fontSize * scale;
  }

  /// Get current device type
  static DeviceType getDeviceType() => deviceType;
}

/// Extensions for .h, .w, .sp without context
extension ResponsiveExtensions on num {
  double get h => ResponsiveHelper.setHeight(this);
  double get w => ResponsiveHelper.setWidth(this);
  double get sp => ResponsiveHelper.setSp(this);
}

/// Gap helper for spacing
class Gap {
  static SizedBox h(double value) => SizedBox(width: value.w);
  static SizedBox v(double value) => SizedBox(height: value.h);
}

/// Wrapper to initialize ResponsiveHelper globally
class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  const ResponsiveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.init(context);
    return child;
  }
}
