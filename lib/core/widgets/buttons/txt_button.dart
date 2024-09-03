import 'package:flutter/cupertino.dart';

import '../texts/text_r.dart';

class TxtButton extends StatelessWidget {
  const TxtButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 24,
      child: TextM(
        title,
        fontSize: 16,
      ),
    );
  }
}
