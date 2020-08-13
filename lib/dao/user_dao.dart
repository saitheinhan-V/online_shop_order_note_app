import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user WHERE phoneNo = :phoneNo and password = :password')
  Future<City> findUserById(String phoneNo,String password);
  @Query('SELECT * FROM user')
  Future<List<User>> findAllUser();
  @Query('SELECT * FROM user')
  Stream<List<User>> findAllUserAsStream();
  @insert
  Future<void> insertUser(User user);
  @insert
  Future<void> insertUsers(List<User> user);
  @update
  Future<void> updateUser(User user);
  @delete
  Future<void> deleteUser(User user);

 }
