import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(
    this.delay,
    this.child, {
    Key? key,
  }) : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(curve);
    _translateAnimation =
        Tween(begin: Offset(0, -30.0), end: Offset(0, 0)).animate(curve);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.translate(
            offset: _translateAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
