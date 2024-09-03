import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/income.dart';

double navBarHeight = 62;

int getCurrentTimestamp() {
  return DateTime.now().millisecondsSinceEpoch ~/ 1000;
}

String formatTimestamp(int timestamp) {
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

String formatDateTime(DateTime date) {
  String formattedDate = DateFormat('dd.MM.yyyy').format(date);
  return formattedDate;
}

DateTime convertToDateTime(String date) {
  return DateFormat('dd.MM.yyyy').parse(date);
}

bool getButtonActive(List<TextEditingController> controllers) {
  for (TextEditingController controller in controllers) {
    if (controller.text.isEmpty) return false;
  }
  return true;
}

double getStatusBar(BuildContext context) {
  return MediaQuery.of(context).viewPadding.top;
}

double getBottom(BuildContext context) {
  return MediaQuery.of(context).viewPadding.bottom;
}

void precacheImages(BuildContext context) {
  List<String> imageAssets = [
    'assets/onboarding1.png',
    'assets/onboarding2.png',
  ];
  for (String assets in imageAssets) {
    precacheImage(AssetImage(assets), context);
  }
}

String getCategoryAsset(String cat) {
  if (cat == 'Business') return 'assets/cat1.svg';
  if (cat == 'Salary') return 'assets/cat2.svg';
  if (cat == 'Dividends') return 'assets/cat3.svg';
  if (cat == 'Investment') return 'assets/cat4.svg';
  if (cat == 'Rent') return 'assets/cat5.svg';
  if (cat == 'Freelance') return 'assets/cat6.svg';
  if (cat == 'Royalty') return 'assets/cat7.svg';
  if (cat == 'Procurement') return 'assets/cat8.svg';
  if (cat == 'Food') return 'assets/cat9.svg';
  if (cat == 'Transport') return 'assets/cat10.svg';
  if (cat == 'Rest') return 'assets/cat11.svg';
  if (cat == 'Investment') return 'assets/cat12.svg';
  return 'assets/cat1.svg';
}

int getAmount(List<Income> incomes, bool isIncome) {
  int incomeAmount = 0;
  int expenseAmount = 0;
  for (Income income in incomes) {
    if (income.isIncome) {
      incomeAmount += income.amount;
    } else {
      expenseAmount += income.amount;
    }
  }
  if (isIncome) return incomeAmount;
  return expenseAmount;
}
