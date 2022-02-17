import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  final String? loadingText;

  LoadingDialog({
    required this.loadingText,
  });

  cancel(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        children: <Widget>[
          const CircularProgressIndicator(),
          const SizedBox(width: 12),
          Flexible(child: Text(loadingText ?? "")),
        ],
      ),
    );
  }
}
