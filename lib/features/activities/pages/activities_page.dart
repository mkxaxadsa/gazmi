import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../../income/bloc/income_bloc.dart';
import '../bloc/filter_bloc.dart';
import '../widget/bar_chart_widget.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  int tabIndex = 1;

  void changeTab(String title) {
    setState(() {
      if (title == 'Day') {
        tabIndex = 1;
        context.read<FilterBloc>().add(FilterDataEvent('Day'));
      } else if (title == 'Week') {
        tabIndex = 2;
        context.read<FilterBloc>().add(FilterDataEvent('Week'));
      } else {
        tabIndex = 3;
        context.read<FilterBloc>().add(FilterDataEvent('Month'));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    var read = context.read<FilterBloc>();
    read.add(FilterDataEvent('Day'));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 44 + getStatusBar(context)),
        const Center(
          child: TextB(
            'Activities',
            fontSize: 32,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _Tab(
              title: 'Day',
              active: tabIndex == 1,
              onTap: changeTab,
            ),
            const SizedBox(width: 8),
            _Tab(
              title: 'Week',
              active: tabIndex == 2,
              onTap: changeTab,
            ),
            const SizedBox(width: 8),
            _Tab(
              title: 'Month',
              active: tabIndex == 3,
              onTap: changeTab,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 15),
              const _BarChart(),
              const SizedBox(height: 25),
              BlocBuilder<IncomeBloc, IncomeState>(
                builder: (context, state) {
                  if (state is IncomeLoadedState) {
                    return Column(
                      children: [
                        _TotalAmount(state.incomeAmount - state.expenseAmount),
                        const SizedBox(height: 25),
                        _IncomeExpenseCard(
                          expense: state.expenseAmount,
                          income: state.incomeAmount,
                        ),
                        const SizedBox(height: 25),
                      ],
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
        SizedBox(height: navBarHeight),
      ],
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.title,
    required this.active,
    required this.onTap,
  });

  final String title;
  final bool active;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        onTap(title);
      },
      padding: EdgeInsets.zero,
      minSize: 40,
      child: Container(
        height: 40,
        width: active ? 80 : 96,
        decoration: BoxDecoration(
          color: active ? AppColors.green : AppColors.navbar,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextR(
            title,
            fontSize: 16,
            color: active ? AppColors.white : AppColors.white50,
          ),
        ),
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BarChartWidget(),
    );
  }
}

class _TotalAmount extends StatelessWidget {
  const _TotalAmount(this.income);

  final int income;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.navbar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          TextM(
            'Total amount',
            fontSize: 16,
            color: AppColors.white50,
          ),
          const Spacer(),
          TextM(
            '\$$income',
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}

class _IncomeExpenseCard extends StatelessWidget {
  const _IncomeExpenseCard({required this.expense, required this.income});

  final int income;
  final int expense;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113,
      decoration: BoxDecoration(
        color: AppColors.navbar,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 56,
            child: Row(
              children: [
                const SizedBox(width: 18),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                TextM(
                  'Income',
                  fontSize: 16,
                  color: AppColors.white50,
                ),
                const Spacer(),
                TextM(
                  '\$$income',
                  fontSize: 16,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
          Container(
            height: 1,
            color: AppColors.white8,
          ),
          SizedBox(
            height: 56,
            child: Row(
              children: [
                const SizedBox(width: 18),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 10),
                TextM(
                  'Expense',
                  fontSize: 16,
                  color: AppColors.white50,
                ),
                const Spacer(),
                TextM(
                  '\$$expense',
                  fontSize: 16,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
