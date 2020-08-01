import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';

@dao
abstract class CityDao {
  @Query('SELECT * FROM city WHERE id = :id')
  Future<City> findCityById(int id);
  @Query('SELECT * FROM city')
  Future<List<City>> findAllCity();
  @Query('SELECT * FROM city')
  Stream<List<City>> findAllCityAsStream();
  @insert
  Future<void> insertCity(City city);
  @insert
  Future<void> insertCites(List<City> city);
  @update
  Future<void> updateCity(City city);
  @delete
  Future<void> deleteCity(City city);

 }
