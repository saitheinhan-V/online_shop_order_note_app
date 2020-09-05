import 'package:floor/floor.dart';

@entity
class OrderDetail{
  @PrimaryKey(autoGenerate: true)
  int orderDetailId;
  double price;
  int qty;
  double discount;
  double amt;
  int sizeId;
  int colorId;
  String imgUrl;
}