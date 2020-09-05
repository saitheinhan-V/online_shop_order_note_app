import 'package:floor/floor.dart';
@entity
class Order{
   @PrimaryKey(autoGenerate: true)
   int orderId;
   bool isPaid;
   double discount;
   String dueDate;
   double paidAmount;
   String orderDate;
   String updateDate;
   double orderTotalAmt;
   int orderTotalQty;
   String customerCode;
   String accountId;
   double deliveryFee;
   String remark;
   bool deleted;
   bool isDelivered;
   String cusId;
}