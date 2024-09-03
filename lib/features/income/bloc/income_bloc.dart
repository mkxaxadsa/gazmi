import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/db/db.dart';
import '../../../core/models/income.dart';
import '../../../core/utils.dart';

part 'income_event.dart';
part 'income_state.dart';

class IncomeBloc extends Bloc<IncomeEvent, IncomeState> {
  IncomeBloc() : super(IncomeInitial()) {
    on<GetIncomesEvent>((event, emit) async {
      if (incomesList.isEmpty) {
        await getIncomes();

        emit(IncomeLoadedState(
          incomes: incomesList,
          incomeAmount: getAmount(incomesList, true),
          expenseAmount: getAmount(incomesList, false),
        ));
      } else {
        emit(IncomeLoadedState(
          incomes: incomesList,
          incomeAmount: getAmount(incomesList, true),
          expenseAmount: getAmount(incomesList, false),
        ));
      }
    });

    on<AddIncomeEvent>((event, emit) async {
      incomesList.add(event.income);
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });

    on<EditIncomeEvent>((event, emit) async {
      for (Income income in incomesList) {
        if (income.id == event.income.id) {
          income.title = event.income.title;
          income.amount = event.income.amount;
          income.category = event.income.category;
          income.isIncome = event.income.isIncome;
        }
      }
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });

    on<DeleteIncomeEvent>((event, emit) async {
      incomesList.removeWhere((element) => element.id == event.id);
      await updateIncomes();

      emit(IncomeLoadedState(
        incomes: incomesList,
        incomeAmount: getAmount(incomesList, true),
        expenseAmount: getAmount(incomesList, false),
      ));
    });
  }
}
