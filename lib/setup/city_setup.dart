import 'package:flutter/material.dart';
import 'package:order_app/common/global.dart';
import 'package:order_app/dao/city_dao.dart';
import 'package:order_app/database/database.dart';
import 'package:order_app/models/city.dart';

class CitySetupPage extends StatefulWidget {
  @override
  _CitySetupPageState createState() => _CitySetupPageState();
}

class _CitySetupPageState extends State<CitySetupPage> {
  List<City> cityList=new List<City>();
  FocusNode focusNode= new FocusNode();
  TextEditingController controller=new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String cityName="";
  CityDao cityDao;
  City city;


  @override
  void initState() {
    getDatabase();
    // TODO: implement initState
    super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            addNewCity(-1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
        child: ListView.builder(
        itemCount: cityList.length,
        itemBuilder: (context,index){
          return GestureDetector(
            onDoubleTap: (){
              setState(() {
                addNewCity(index);
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              child: Column(
                children: <Widget>[
                  Text(cityList[index].cityName,
                    style: TextStyle(
                        fontSize: 15.0
                    ),),
                  SizedBox(height: 10.0,),
                  Container(height: 1.0,color: Colors.black26,)
                ],
              ),
            ),
          );
        },
      ),
      ),
    );
  }

  addNewCity(int index) {

    if(index >= 0){
      cityName = cityList[index].cityName;
      if(cityName.isNotEmpty){
        controller.text = cityName;
      }
    }else{
      controller.text = "";
    }

    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx){
          return AlertDialog(
            title: Text("New City Entry"),
            content: Container(
              height: 80.0,
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: TextFormField(
                        validator: (value){
                          if(value.isEmpty){
                            return 'Enter City Name';
                          }
                          return null;
                        },
                        autofocus: true,
                        focusNode: focusNode,
                        controller: controller,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'City Name',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              new FlatButton(
                  onPressed: (){
                    setState(() {
                      Navigator.pop(ctx);
                    });
                  },
                  child: Text('Cancel')),
              new FlatButton(
                  onPressed: (){
                    setState(() {
                      if(_formKey.currentState.validate()){
                        if(index<0){
                          city =City(null,controller.text.toString());
                          cityDao.insertCity(city);
                          cityList.add(city);
                        }else{
                          int id =cityList[index].cityId;
                          city =City(id, controller.text.toString());
                          cityDao.updateCity(city);
                          cityList.removeAt(index);
                          cityList.insert(index,city );
                        }
                        Navigator.pop(ctx);
                      }
                    });
                  },
                  child: Text('Save',),
              ),
            ],
          );
      }
    );
  }
Future<void> getDatabase() async{
  cityDao = Global.database.cityDao;
  cityList = await cityDao.findAllCity();
  int count = cityList.length;
  print("City List Size : $count");
  setState(() {});
}

}

