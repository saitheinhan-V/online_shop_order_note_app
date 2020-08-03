import 'package:floor/floor.dart';
@Entity(primaryKeys: ['period', 'type','serialNo'])
class GenId{
  String period;
  String type;
  int serialNo;
}