import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PageSwitcher extends StatefulWidget {
  PageSwitcher({
    Key key,
    @required this.index,
    @required this.children,
    this.duration = const Duration(milliseconds: 300),
  })  : assert(index != null),
        assert(children != null),
        assert(children.isNotEmpty),
        super(key: key);

  final int index;
  final List<Widget> children;
  final Duration duration;

  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher>
    with TickerProviderStateMixin {
  // Create animation controllers
  AnimationController _primaryAnimation;
  AnimationController _secondaryAnimation;

  @override
  void didUpdateWidget(PageSwitcher oldWidget) {
    if (widget.index != oldWidget.index) {
      _primaryAnimation.forward(from: 0.0);
      _secondaryAnimation.reverse(from: 1.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // Create animation controllers and start running the animations.

    _primaryAnimation = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _secondaryAnimation = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _primaryAnimation.forward();
    _secondaryAnimation.reverse();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeThroughTransition(
      animation: _primaryAnimation,
      secondaryAnimation: _secondaryAnimation,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }

  @override
  void dispose() {
    _primaryAnimation.dispose();
    _secondaryAnimation.dispose();
    super.dispose();
  }
}
