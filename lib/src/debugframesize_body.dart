part of '../flutter_debugframesize.dart';

/// Style to decorate the DebugFrameSize body
///
///  - Color? `color`: text and border color
///  - Color? `negativeColor`: background color of label
///  - double? `thickness`: border thickness
///  - double? `fontSize`: font size of label
///  - List<double>? `dashPattern`: dash pattern of border
///  - Alignment? `alignment`: alignment of label
///
class DebugFrameSizeBodyStyle {
  final Color? color;
  final Color? negativeColor;
  final double? thickness;
  final double? fontSize;
  final List<double>? dashPattern;
  final Alignment? alignment;

  const DebugFrameSizeBodyStyle({
    this.color,
    this.negativeColor,
    this.thickness,
    this.fontSize,
    this.dashPattern,
    this.alignment,
  });
}


/// DebugFrameSizeBody
///
///  - DebugFrameSizeBodyStyle? `debugFrameSizeBodyStyle`: body style of debugFrameSize
///
class DebugFrameSizeBody extends StatefulWidget {

  final DebugFrameSizeBodyStyle? debugFrameSizeBodyStyle;

  const DebugFrameSizeBody({
    super.key,
    this.debugFrameSizeBodyStyle,
  });

  @override
  State<DebugFrameSizeBody> createState() => _DebugFrameSizeBodyState();
}

class _DebugFrameSizeBodyState extends State<DebugFrameSizeBody> {

  DebugFrameSizeBodyStyle? style;

  @override
  void initState() {
    super.initState();
    style = widget.debugFrameSizeBodyStyle ?? const DebugFrameSizeBodyStyle();
  }

  @override
  Widget build(BuildContext context) {

    Color color = style?.color ?? (
        Theme.of(context).colorScheme.error
    );

    Color negativeColor = style?.negativeColor ?? (
        Theme.of(context).colorScheme.onError
    );

    double thickness = style?.thickness ?? (
        Theme.of(context).textTheme.labelMedium?.decorationThickness
    ) ?? 1.0;

    List<double> dashPattern = style?.dashPattern ?? [3, 3];

    double fontSize = style?.fontSize ?? (
        Theme.of(context).textTheme.labelMedium?.fontSize
    ) ?? 12.0;

    Alignment alignment = style?.alignment ?? Alignment.topLeft;

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.maxWidth;
          double height = constraints.maxHeight;
          int iw = width.toInt();
          int ih = height.toInt();
          return DottedBorder(
              color: color,
              strokeWidth: thickness,
              dashPattern: dashPattern,
              child: Align(
                  alignment: alignment,
                  child: Container(
                      color: negativeColor.withOpacity(0.75),
                      child: Text(
                        "${iw}px x ${ih}px",
                        style: TextStyle(
                            fontSize: fontSize,
                            color: color
                        ),
                      )

                  )
              )
          );
        }
    );
  }

}