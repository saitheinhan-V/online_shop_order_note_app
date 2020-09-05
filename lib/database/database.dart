
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:order_app/dao/city_dao.dart';
import 'package:order_app/dao/color_dao.dart';
import 'package:order_app/dao/customer_dao.dart';
import 'package:order_app/dao/expense_dao.dart';
import 'package:order_app/dao/genId_dao.dart';
import 'package:order_app/dao/gender_dao.dart';
import 'package:order_app/dao/order_dao.dart';
import 'package:order_app/dao/order_detail_dao.dart';
import 'package:order_app/dao/size_dao.dart';
import 'package:order_app/dao/user_dao.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/color.dart';
import 'package:order_app/models/customer.dart';
import 'package:order_app/models/expense.dart';
import 'package:order_app/models/genId.dart';
import 'package:order_app/models/gender.dart';
import 'package:order_app/models/order.dart';
import 'package:order_app/models/order_details.dart';
import 'package:order_app/models/size.dart';
import 'package:order_app/models/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'database.g.dart';

@Database(version: 1, entities: [City,ItemSize,Color,Gender,Expense,Customer,GenId,User,Order,OrderDetail])
abstract class FlutterDatabase extends FloorDatabase {
  CityDao get cityDao;
  SizeDao get sizeDao;
  ColorDao get colorDao;
  GenderDao get genderDao;
  ExpenseDao get expenseDao;
  CustomerDao get customerDao;
  GenIdDao get genIdDao;
  UserDao get userDao;
  OrderDao get orderDao;
  OrderDetailDao get orderDetailDao;

}
