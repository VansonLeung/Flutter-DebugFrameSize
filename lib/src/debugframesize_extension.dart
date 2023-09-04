part of '../flutter_debugframesize.dart';

/// Support `debugFrameSize` extension to any Widget
///
///  - usage:
///
///  ```dart
///  Padding(
///    padding: const EdgeInsets.symmetric(horizontal: 40),
///    child: const SizedBox(width: double.infinity, height: 20).debugFrameSize(),
///  ),
///  ```
///
///  ```dart
///
///  Image.network(
///    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif')
///    .debugFrameSize(
///      debugFrameSizeBodyStyle: const DebugFrameSizeBodyStyle(
///        color: Color(0xFF00cc00),
///        fontSize: 20,
///        thickness: 4,
///        dashPattern: [10, 10],
///      ),
///    ),
///  ```
///
extension StyledWidget on Widget {

  Widget copyWith({
    DebugFrameSizeBodyStyle? debugFrameSizeBodyStyle,
  }) {

    return Stack(
        children: [
          this,
          Positioned.fill(
            child: Stack(
             children: [
               Positioned.fill(
                 child: DebugFrameSizeBody(
                   debugFrameSizeBodyStyle: debugFrameSizeBodyStyle,
                 ),
               ),
             ]
           )
          ),
        ]);
  }

  Widget debugFrameSize({
    DebugFrameSizeBodyStyle? debugFrameSizeBodyStyle,
  }) {
    return copyWith(
      debugFrameSizeBodyStyle: debugFrameSizeBodyStyle,
    );
  }
}
