import 'package:lombok/lombok.dart';

@getter
@setter
class City{
  int cityId;
  String cityName;

  City(this.cityId, this.cityName);

}