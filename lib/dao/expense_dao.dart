import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/expense.dart';

@dao
abstract class ExpenseDao {
  @Query('SELECT * FROM expense WHERE id = :id')
  Future<Expense> findExpenseById(int id);
  @Query('SELECT * FROM expense')
  Future<List<Expense>> findAllExpense();
  @Query('SELECT * FROM expense')
  Stream<List<City>> findAllExpenseAsStream();
  @insert
  Future<void> insertExpense(Expense expense);
  @insert
  Future<void> insertExpenses(List<Expense> list);
  @update
  Future<void> updateExpense(Expense expense);
  @delete
  Future<void> deleteExpense(Expense expense);

  }
