import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリ全体に半透明のローディング画面を重ねるかどうか。
final overlayLoadingProvider = StateProvider<bool>((_) => false);

class OverlayLoadingWidget extends StatelessWidget {
  const OverlayLoadingWidget({
    super.key,
    this.backgroundColor = Colors.grey,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor,
      child: const SizedBox.expand(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
