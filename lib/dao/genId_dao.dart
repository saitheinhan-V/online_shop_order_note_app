import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/customer.dart';
import 'package:order_app/models/genId.dart';

@dao
abstract class GenIdDao {
  @Query('SELECT * FROM genId WHERE period = :period and type = :type and serialNo =:serialNo')
  Future<City> finGenIdByID(String period,String type,int serialNo);
  @Query('SELECT * FROM genId')
  Future<List<City>> findAll();
  @Query('SELECT * FROM genId')
  Stream<List<City>> findAllAsSteam();
  @insert
  Future<void> insertGenId(GenId genId);
  @insert
  Future<void> insertGenIds(List<GenId> genId);
  @update
  Future<void> updateGenId(GenId genId);
  @delete
  Future<void> deleteGenId(GenId genId);
 }
