import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils.dart';
import '../../../core/models/income.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/dialogs/delete_dialog.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../../../core/widgets/texts/text_r.dart';
import '../bloc/income_bloc.dart';
import '../widgets/category_tile.dart';
import '../widgets/sheet_appbar.dart';

class EditIncomeSheet extends StatefulWidget {
  const EditIncomeSheet({super.key, required this.income});

  final Income income;

  @override
  State<EditIncomeSheet> createState() => _EditIncomeSheetState();
}

class _EditIncomeSheetState extends State<EditIncomeSheet> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  bool active = true;

  bool getCat(String cat) {
    return controller3.text == cat;
  }

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
      ]);
    });
  }

  void onCat(String cat) {
    controller3.text = cat;
    checkActive();
  }

  void onEdit() {
    context.read<IncomeBloc>().add(
          EditIncomeEvent(
            income: Income(
              id: widget.income.id,
              title: controller1.text,
              amount: int.tryParse(controller2.text) ?? 0,
              category: controller3.text,
              isIncome: widget.income.isIncome,
            ),
          ),
        );
    context.pop();
  }

  void onDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return DeleteDialog(
          title: widget.income.isIncome ? 'Delete Income?' : 'Delete Expense?',
          onYes: () {
            context
                .read<IncomeBloc>()
                .add(DeleteIncomeEvent(id: widget.income.id));
            context.pop();
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    controller1.text = widget.income.title;
    controller2.text = widget.income.amount.toString();
    controller3.text = widget.income.category;
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.75),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff000000).withOpacity(0.05),
            blurRadius: 100,
            spreadRadius: 0,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          SheetAppbar(
            isIncome: widget.income.isIncome,
            title: 'Edit',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const SizedBox(height: 16),
                TextM(
                  'Title',
                  fontSize: 16,
                  color: AppColors.white40,
                ),
                const SizedBox(height: 8),
                TxtField(
                  controller: controller1,
                  hintText: 'Name title',
                  onChanged: checkActive,
                ),
                const SizedBox(height: 16),
                TextM(
                  'Amount (\$)',
                  fontSize: 16,
                  color: AppColors.white40,
                ),
                const SizedBox(height: 8),
                TxtField(
                  controller: controller2,
                  hintText: widget.income.isIncome
                      ? 'Amount Income'
                      : 'Amount Expense',
                  number: true,
                  length: 6,
                  onChanged: checkActive,
                ),
                const SizedBox(height: 16),
                TextM(
                  'Amount (\$)',
                  fontSize: 16,
                  color: AppColors.white40,
                ),
                const SizedBox(height: 8),
                if (widget.income.isIncome) ...[
                  CategoryTile(
                    id: 1,
                    title: 'Business',
                    active: getCat('Business'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 2,
                    title: 'Salary',
                    active: getCat('Salary'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 3,
                    title: 'Dividends',
                    active: getCat('Dividends'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 4,
                    title: 'Investment',
                    active: getCat('Investment'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 5,
                    title: 'Rent',
                    active: getCat('Rent'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 6,
                    title: 'Freelance',
                    active: getCat('Freelance'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 7,
                    title: 'Royalty',
                    active: getCat('Royalty'),
                    onTap: onCat,
                  ),
                ] else ...[
                  CategoryTile(
                    id: 8,
                    title: 'Procurement',
                    active: getCat('Procurement'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 9,
                    title: 'Food',
                    active: getCat('Food'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 10,
                    title: 'Transport',
                    active: getCat('Transport'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 11,
                    title: 'Rest',
                    active: getCat('Rest'),
                    onTap: onCat,
                  ),
                  CategoryTile(
                    id: 12,
                    title: 'Investment',
                    active: getCat('Investment'),
                    onTap: onCat,
                  ),
                ],
                const SizedBox(height: 8),
                PrimaryButton(
                  title: 'Edit',
                  active: active,
                  onPressed: onEdit,
                ),
                const SizedBox(height: 8),
                PrimaryButton(
                  title: 'Delete',
                  onPressed: onDelete,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
