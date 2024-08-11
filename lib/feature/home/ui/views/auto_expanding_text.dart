import 'package:flutter/material.dart';

class AutoExpandingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  // final Duration duration;
  final Animation<double> animation;

  const AutoExpandingText({
    Key? key,
    required this.text,
    required this.animation,
    this.style,
    // this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _AutoExpandingText(
          animation: animation,
          text: text,
          style: style,
          // duration: duration,
          maxWidth: constraints.maxWidth,
        );
      },
    );
  }
}

class _AutoExpandingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  // final Duration duration;
  final double maxWidth;
  final Animation<double> animation;

  const _AutoExpandingText({
    Key? key,
    required this.text,
    this.style,
    required this.animation,
    // required this.duration,
    required this.maxWidth,
  }) : super(key: key);

  @override
  State<_AutoExpandingText> createState() => __AutoExpandingTextState();
}

class __AutoExpandingTextState extends State<_AutoExpandingText>
    with SingleTickerProviderStateMixin {
  // List<Animation<double>> _lineAnimations = [];
  List<String> _lines = [];
  double? height;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _calculateLines);
  }

  void _calculateLines() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    textPainter.layout(maxWidth: widget.maxWidth);

    final List<String> lines = [];
    int lastOffset = 0;
    for (var metrics in textPainter.computeLineMetrics()) {
      final end = textPainter
          .getPositionForOffset(Offset(metrics.width, metrics.baseline))
          .offset;
      height ??= metrics.height;
      if (end > lastOffset) {
        lines.add(widget.text.substring(lastOffset, end).trim());
        lastOffset = end;
      }
    }

    setState(() => _lines = lines);

    // _controller.forward();
  }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context, child) {
        // debugPrint('Building $_lines');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_lines.length, (index) {
            final delay = index / _lines.length;
            final endValue = (index + 1) / _lines.length;
            final lineAnimation = CurvedAnimation(
              parent: widget.animation,
              curve: Interval(
                delay,
                endValue,
                curve: Curves.easeOut,
              ),
            );

            return ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: lineAnimation.value,
                child: Opacity(
                  opacity: lineAnimation.value,
                  child: Transform.translate(
                    offset: Offset(0, (1 - lineAnimation.value) * 20),
                    child: Text(
                      _lines[index],
                      style: widget.style,
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
