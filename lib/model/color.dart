import 'package:hive/hive.dart';
@HiveType(typeId: 1)
class Color extends  HiveObject{
 @HiveField(0)
 String colorName;
}