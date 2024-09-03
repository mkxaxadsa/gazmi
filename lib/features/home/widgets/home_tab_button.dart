import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    super.key,
    required this.title,
    required this.active,
    required this.value,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool value;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: active ? AppColors.green : AppColors.navbar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CupertinoButton(
          onPressed: () {
            onPressed(value);
          },
          padding: EdgeInsets.zero,
          minSize: 40,
          child: Center(
            child: TextR(
              title,
              fontSize: 16,
              font: Fonts.interR,
              color: active ? AppColors.white : AppColors.white50,
            ),
          ),
        ),
      ),
    );
  }
}
