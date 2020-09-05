
import 'package:floor/floor.dart';
import 'package:order_app/models/order_details.dart';

@dao
abstract class OrderDetailDao {
  @Query('SELECT * FROM OrderDetail WHERE id = :id')
  Future<OrderDetail> findOrderDetailById(int id);
  @Query('SELECT * FROM OrderDetail')
  Future<List<OrderDetail>> findAllOrderDetail();
  @Query('SELECT * FROM OrderDetail')
  Stream<List<OrderDetail>> findAllOrderDetailsAsStream();
  @insert
  Future<void> insertOrderDetail(OrderDetail od);
  @insert
  Future<void> insertOrderDetails(List<OrderDetail> listOD);
  @update
  Future<void> updateOrderDetail(OrderDetail od);
  @delete
  Future<void> deleteOrderDetail(OrderDetail od);
}