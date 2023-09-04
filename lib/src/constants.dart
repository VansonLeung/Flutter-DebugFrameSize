part of '../flutter_debugframesize.dart';


class FlutterDebugFrameSizeConstants {

  /// If `isNeverEnabled` is set to `true`, ValueListenableBuilder logic will be skipped.
  /// `.debugFrameSize()` will behave as if it did not exist.
  ///
  /// Used to guarantee the plugin in production environment disabled.
  static bool isNeverEnabled = kReleaseMode;


  /// `isEnabled`: if `isNeverEnabled` is set to `false`, it will work.
  ///
  /// It is a dynamic value to runtime toggle the plugin.
  static ValueNotifier<bool> isEnabled = ValueNotifier(true);
}