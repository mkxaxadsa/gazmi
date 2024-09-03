part of 'income_bloc.dart';

abstract class IncomeEvent {}

class GetIncomesEvent extends IncomeEvent {}

class AddIncomeEvent extends IncomeEvent {
  final Income income;
  AddIncomeEvent({required this.income});
}

class EditIncomeEvent extends IncomeEvent {
  final Income income;
  EditIncomeEvent({required this.income});
}

class DeleteIncomeEvent extends IncomeEvent {
  final int id;
  DeleteIncomeEvent({required this.id});
}
