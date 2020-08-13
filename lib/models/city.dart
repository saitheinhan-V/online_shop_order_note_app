
import 'package:floor/floor.dart';
@entity
class City{
  @PrimaryKey(autoGenerate: true)
  final int cityId;
  final String cityName;

  City(this.cityId, this.cityName);

}