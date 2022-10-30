import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PostResult extends HookWidget {
  const PostResult({super.key});
  // late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    final birdController = useAnimationController(
      duration: const Duration(milliseconds: 2300),
    );
    final birdAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(birdController);
    return Scaffold(
      body: Center(
        child: SlideTransition(
          position: birdAnimation,
          child: FadeTransition(
            opacity: birdController,
            child: Column(children: [
              Image.asset('assets/images/shine.png'),
            ]),
          ),
        ),
      ),
    );
  }
}
