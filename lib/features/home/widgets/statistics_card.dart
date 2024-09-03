import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../income/bloc/income_bloc.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SvgPicture.asset(
                'assets/card_bg.svg',
                fit: BoxFit.fill,
              ),
            ),
            BlocBuilder<IncomeBloc, IncomeState>(
              builder: (context, state) {
                if (state is IncomeLoadedState) {
                  return Row(
                    children: [
                      const SizedBox(width: 24),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextM(
                            'Total Portfolio',
                            fontSize: 16,
                            font: Fonts.mulishM,
                          ),
                          TextB(
                            '\$${state.incomeAmount - state.expenseAmount}',
                            fontSize: 32,
                            font: Fonts.mulishB,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextM(
                            'Income',
                            fontSize: 14,
                            font: Fonts.mulishM,
                          ),
                          const SizedBox(height: 4),
                          TextB(
                            '\$${state.incomeAmount}',
                            fontSize: 16,
                            font: Fonts.mulishB,
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextM(
                            'Expense',
                            fontSize: 14,
                            font: Fonts.mulishM,
                          ),
                          const SizedBox(height: 4),
                          TextB(
                            '\$${state.expenseAmount}',
                            fontSize: 16,
                            font: Fonts.mulishB,
                          ),
                        ],
                      ),
                      const SizedBox(width: 28),
                    ],
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
