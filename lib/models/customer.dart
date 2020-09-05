import 'package:floor/floor.dart';

@entity
class Customer{
   @PrimaryKey(autoGenerate: false)
   String cusId;
   String cusName;
   String cusPhoneNo;
   String cusAddress;
   String cusRegDate;
   String cusEmail;
   String cusSocialLink;
   int  cityId;
   int genderId;

}