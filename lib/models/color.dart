import 'package:floor/floor.dart';
@entity
class Color{
  @PrimaryKey(autoGenerate: true)
  final int colorId;
  final String colorName;

  Color(this.colorId, this.colorName);
}