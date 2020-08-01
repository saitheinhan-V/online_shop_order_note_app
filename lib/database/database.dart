
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:order_app/dao/city_dao.dart';
import 'package:order_app/dao/color_dao.dart';
import 'package:order_app/dao/expense.dart';
import 'package:order_app/dao/gender.dart';
import 'package:order_app/dao/size_dao.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/color.dart';
import 'package:order_app/models/expense.dart';
import 'package:order_app/models/gender.dart';
import 'package:order_app/models/size.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [City,ItemSize,Color,Gender,Expense])
abstract class FlutterDatabase extends FloorDatabase {
  CityDao get cityDao;
  SizeDao get sizeDao;
  ColorDao get colorDao;
  GenderDao get genderDao;
  ExpenseDao get expenseDao;
}
