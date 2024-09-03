import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class Income {
  @HiveField(0)
  final int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  int amount;
  @HiveField(3)
  String category;
  @HiveField(4)
  bool isIncome;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.isIncome,
  });
}

class IncomeAdapter extends TypeAdapter<Income> {
  @override
  final typeId = 0;

  @override
  Income read(BinaryReader reader) {
    return Income(
      id: reader.read(),
      title: reader.read(),
      amount: reader.read(),
      category: reader.read(),
      isIncome: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Income obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.amount);
    writer.write(obj.category);
    writer.write(obj.isIncome);
  }
}
