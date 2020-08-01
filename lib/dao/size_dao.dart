import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/size.dart';

@dao
abstract class SizeDao {
  @Query('SELECT * FROM ItemSize WHERE id = :id')
  Future<ItemSize> findSizeById(int id);
  @Query('SELECT * FROM ItemSize')
  Future<List<ItemSize>> findAllSize();
  @Query('SELECT * FROM ItemSize')
  Stream<List<City>> findAllSizesAsStream();
  @insert
  Future<void> insertSize(ItemSize itemSize);
  @insert
  Future<void> insertSizes(List<ItemSize> list);
  @update
  Future<void> updateSize(ItemSize size);
  @delete
  Future<void> deleteSize(ItemSize size);
  }
