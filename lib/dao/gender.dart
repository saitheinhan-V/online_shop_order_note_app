import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/gender.dart';

@dao
abstract class GenderDao {
  @Query('SELECT * FROM gender WHERE id = :id')
  Future<Gender> findGenderById(int id);
  @Query('SELECT * FROM gender')
  Future<List<Gender>> findAllGender();
  @Query('SELECT * FROM gender')
  Stream<List<City>> findAllGenderAsStream();
  @insert
  Future<void> insertGender(Gender gender);
  @insert
  Future<void> insertGenders(List<Gender> list);
  @update
  Future<void> updateGender(Gender gender);
  @delete
  Future<void> deleteGender(Gender gender);

  }
