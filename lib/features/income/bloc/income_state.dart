part of 'income_bloc.dart';

abstract class IncomeState {}

class IncomeInitial extends IncomeState {}

class IncomeLoadedState extends IncomeState {
  final List<Income> incomes;
  final int incomeAmount;
  final int expenseAmount;
  IncomeLoadedState({
    required this.incomes,
    required this.incomeAmount,
    required this.expenseAmount,
  });
}
