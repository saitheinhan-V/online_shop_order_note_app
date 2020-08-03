import 'package:floor/floor.dart';
import 'package:order_app/models/city.dart';
import 'package:order_app/models/customer.dart';

@dao
abstract class CustomerDao {
  @Query('SELECT * FROM customer WHERE id = :id')
  Future<City> findCustomerById(int id);
  @Query('SELECT * FROM customer')
  Future<List<City>> findAllCustomers();
  @Query('SELECT * FROM customer')
  Stream<List<City>> findAllCustomersAsStream();
  @insert
  Future<void> insertCustomer(Customer customer);
  @insert
  Future<void> insertCustomers(List<Customer> customer);
  @update
  Future<void> updateCustomer(Customer customer);
  @delete
  Future<void> deleteCustomer(Customer customer);

 }
