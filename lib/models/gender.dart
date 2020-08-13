import 'package:floor/floor.dart';
@entity
class Gender{
  @PrimaryKey(autoGenerate: true)
  final int genderId;
  final String genderName;

  Gender(this.genderId, this.genderName);
}