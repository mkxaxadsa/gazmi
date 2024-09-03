import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../income/pages/add_income_sheet.dart';

class HomeAddButton extends StatelessWidget {
  const HomeAddButton({super.key, required this.isIncome});

  final bool isIncome;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.navbar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: CupertinoButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              builder: (context) {
                return AddIncomeSheet(isIncome: isIncome);
              },
            );
          },
          padding: EdgeInsets.zero,
          minSize: 40,
          child: Center(
            child: TextR(
              isIncome ? 'Add Income' : 'Add Expense',
              fontSize: 16,
              font: Fonts.interR,
            ),
          ),
        ),
      ),
    );
  }
}
