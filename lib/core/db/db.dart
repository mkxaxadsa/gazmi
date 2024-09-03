import 'package:hive_flutter/hive_flutter.dart';

import '../models/income.dart';

String boxName = 'incomebox19';
List<Income> incomesList = [];

Future<void> initHive() async {
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk(boxName);
  Hive.registerAdapter(IncomeAdapter());
}

Future<void> getIncomes() async {
  final box = await Hive.openBox(boxName);
  List data = box.get('incomesList') ?? [];
  incomesList = data.cast<Income>();
}

Future<void> updateIncomes() async {
  final box = await Hive.openBox(boxName);
  box.put('incomesList', incomesList);
  incomesList = await box.get('incomesList');
}
