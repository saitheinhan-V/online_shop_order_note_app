import 'package:floor/floor.dart';
@entity
class Expense{
  @PrimaryKey(autoGenerate: true)
  final int expenseId;
  final String expenseName;

  Expense(this.expenseId, this.expenseName);
}