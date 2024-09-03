import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';

class SheetAppbar extends StatelessWidget {
  const SheetAppbar({
    super.key,
    required this.isIncome,
    this.title = 'Add',
  });

  final bool isIncome;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 6),
        Container(
          height: 5,
          width: 36,
          decoration: BoxDecoration(
            color: AppColors.white8,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(height: 3),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 23),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextB(
                isIncome ? '$title Income' : '$title Expense',
                fontSize: 32,
              ),
            ),
            const Spacer(),
            CupertinoButton(
              onPressed: () {
                context.pop();
              },
              padding: EdgeInsets.zero,
              minSize: 20,
              child: const TextM(
                'Close',
                fontSize: 16,
                color: AppColors.green,
              ),
            ),
            const SizedBox(width: 23),
          ],
        ),
      ],
    );
  }
}
