import 'package:flutter/cupertino.dart';

import '../../../../core/core.dart';

class _CardProps {
  String text;
  String image;
  bool showText;
  Duration duration;
  TextAlign textAlign;

  _CardProps({
    required this.text,
    required this.image,
    required this.showText,
    required this.duration,
    this.textAlign = TextAlign.start,
  });
}

class HomeBottomSheet extends StatefulWidget {
  final Animation<double> fadeAnimation;

  const HomeBottomSheet({
    super.key,
    required this.fadeAnimation,
  });

  @override
  State<HomeBottomSheet> createState() => HomeBottomSheetState();
}

class HomeBottomSheetState extends State<HomeBottomSheet> {
  final List<_CardProps> _cards = [
    _CardProps(
      text: 'Gladkova St., 25',
      image: ImageAssets.kitchen1,
      showText: false,
      duration: const Duration(milliseconds: 900),
      textAlign: TextAlign.center,
    ),
    _CardProps(
      text: 'Imota St., 24',
      image: ImageAssets.kitchen3,
      showText: false,
      duration: const Duration(milliseconds: 2000),
    ),
    _CardProps(
      text: 'Princeton St., 27',
      image: ImageAssets.kitchen4,
      showText: false,
      duration: const Duration(milliseconds: 1400),
    ),
    _CardProps(
      text: 'Oshodi St., 30',
      image: ImageAssets.kitchen5,
      showText: false,
      duration: const Duration(milliseconds: 1600),
    ),
  ];
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _Card(
            props: _cards[0],
            textFadeAnimation: widget.fadeAnimation,
            expanded: _expanded,
          ),
          const SizedBox(height: 9),
          LayoutBuilder(builder: (_, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    width: constraints.maxWidth / 2 - 4.5,
                    child: _Card(
                      props: _cards[2],
                      expanded: _expanded,
                      textFadeAnimation: widget.fadeAnimation,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: constraints.maxWidth / 2 - 4.5,
                    child: Column(
                      children: [
                        _Card(
                          props: _cards[3],
                          expanded: _expanded,
                          textFadeAnimation: widget.fadeAnimation,
                        ),
                        const SizedBox(height: 9),
                        _Card(
                          props: _cards[3],
                          expanded: _expanded,
                          textFadeAnimation: widget.fadeAnimation,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Future<void> forward() async {
    await _wait(1000);
    setState(() => _expanded = true);
    await _wait(1100);
    _showCardText(0);
    await _wait(300);
    _showCardText(1);
    await _wait(200);
    _showCardText(2);
    await _wait(100);
    _showCardText(3);
  }

  Future<void> _wait(int timeMs) async {
    await Future.delayed(Duration(milliseconds: timeMs));
  }

  void _showCardText(int index) {
    setState(() => _cards[index].showText = true);
  }
}

class _Card extends StatelessWidget {
  final _CardProps props;
  final bool expanded;
  final Animation<double> textFadeAnimation;

  const _Card({
    required this.props,
    required this.textFadeAnimation,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      const left = 10;
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              props.image,
              fit: BoxFit.fill,
              height: constraints.maxHeight == double.infinity
                  ? null
                  : constraints.maxHeight,
            ),
          ),
          Positioned(
            bottom: 15,
            left: 10,
            child: AnimatedContainer(
              duration: props.duration,
              width: expanded ? constraints.maxWidth - (left * 2) : 0,
              curve: Curves.easeOut,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: kSliderBgColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(36),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FadeTransition(
                      opacity: textFadeAnimation,
                      child: AppText(
                        props.showText ? props.text : '',
                        size: 14,
                        weight: FontWeight.w500,
                        align: props.textAlign,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  const CircularContainerIcon(
                    icon: CupertinoIcons.chevron_right,
                    color: kWhite,
                    size: 45,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
