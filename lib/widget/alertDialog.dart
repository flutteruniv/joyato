import 'package:flutter/material.dart';

void openDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return AlertDialog(
        title: const Text('青枠の範囲内のみ\nピンが置けます'),
        content: const Text('再度、青枠の範囲内を\nタップしてください'),
        actions: [
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
