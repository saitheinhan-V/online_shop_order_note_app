import 'package:flutter/material.dart';
import 'package:order_app/models/City.dart';

class CitySetupPage extends StatefulWidget {
  @override
  _CitySetupPageState createState() => _CitySetupPageState();
}

class _CitySetupPageState extends State<CitySetupPage> {

  List<City> cityList=new List<City>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cityList.add(City(1,'Lashio'));
    cityList.add(City(2,'Mandalay'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: cityList.length,
          itemBuilder: (context,index){
            return Container(
              child: Text(cityList[index].cityName),
            );
          },
        ),
      ),
    );
  }
}
