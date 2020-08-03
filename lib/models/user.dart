import 'package:floor/floor.dart';

@entity
class User{
  @primaryKey
  String phoneNo;
  String password;
  String userName;
}