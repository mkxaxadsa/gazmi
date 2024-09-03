import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/income.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../income/pages/edit_income_sheet.dart';

class HomeIncomeCard extends StatelessWidget {
  const HomeIncomeCard({super.key, required this.income});

  final Income income;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CupertinoButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            builder: (context) {
              return EditIncomeSheet(income: income);
            },
          );
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            SvgPicture.asset(
              getCategoryAsset(income.category),
              height: 36,
              width: 36,
              color: AppColors.green,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextM(
                    income.title,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.navbar,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextM(
                            income.category,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: AppColors.navbar,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: TextM(
                            income.isIncome ? 'Income' : 'Expense',
                            fontSize: 14,
                            color: AppColors.white50,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            TextM('\$${income.amount}', fontSize: 18),
          ],
        ),
      ),
    );
  }
}
