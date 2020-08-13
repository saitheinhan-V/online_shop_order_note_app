import 'package:floor/floor.dart';
import 'package:order_app/models/color.dart';

@dao
abstract class ColorDao {
  @Query('SELECT * FROM color WHERE id = :id')
  Future<Color> findColorById(int id);
  @Query('SELECT * FROM color')
  Future<List<Color>> findAllTasks();
  @Query('SELECT * FROM color')
  Stream<List<Color>> findAllTasksAsStream();
  @insert
  Future<void> insertColor(Color color);
  @insert
  Future<void> insertColors(List<Color> color);
  @update
  Future<void> updateColor(Color color);
  @delete
  Future<void> deleteColor(Color color);

 }
