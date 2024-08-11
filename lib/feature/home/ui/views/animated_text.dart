import 'package:flutter/cupertino.dart';

class AnimatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Animation<Offset> position;
  final Animation<double> fade;


  const AnimatedText({
    super.key,
    required this.text,
    required this.style,
    required this.position,
    required this.fade,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      final lines = splitTextIntoLines(constraints.maxWidth);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: lines.map((line) {
          debugPrint(line);
          return SlideTransition(
            position: position,
            child: FadeTransition(
              opacity: fade,
              child: Text(
                line,
                textAlign: TextAlign.start,
                style: style,
              ),
            ),
          );
        }).toList(),
      );
    });
  }

  // TextStyle get style {
  //   return const TextStyle(
  //     height: 1.2,
  //     fontSize: 45,
  //     color: kContrastColor,
  //     fontFamily: "Satoshi",
  //     fontWeight: FontWeight.w500,
  //   );
  // }

  List<String> splitTextIntoLines(double maxWidth) {
    final textSpan = TextSpan(
      text: text,
      style: style,
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: null,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
    )..layout(maxWidth: maxWidth);

    final lines = <String>[];
    int lastIndex = 0;

    for (int i = 0; i < text.length; i++) {
      textPainter.text = TextSpan(
        text: text.substring(0, i + 1),
        style: style,
      );
      textPainter.layout(maxWidth: maxWidth);

      if (textPainter.size.height > textPainter.size.height) {
        lines.add(text.substring(lastIndex, i));
        lastIndex = i;
      }
    }

    if (lastIndex < text.length) {
      lines.add(text.substring(lastIndex));
    }

    return lines;
  }
}
