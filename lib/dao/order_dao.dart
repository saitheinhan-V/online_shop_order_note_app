
import 'package:floor/floor.dart';
import 'package:order_app/models/order.dart';

@dao
abstract class OrderDao {
  @Query('SELECT * FROM Order WHERE id = :id')
  Future<Order> findOrderById(int id);
  @Query('SELECT * FROM Order')
  Future<List<Order>> findAllOrder();
  @Query('SELECT * FROM Order')
  Stream<List<Order>> findAllOrdersAsStream();
  @insert
  Future<void> insertOrder(Order itemSize);
  @insert
  Future<void> insertOrders(List<Order> list);
  @update
  Future<void> updateOrders(Order size);
  @delete
  Future<void> deleteOrder(Order size);
}