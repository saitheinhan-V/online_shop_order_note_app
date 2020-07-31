import 'package:flutter/material.dart';
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

  bool isWriting = false;
  bool validate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    validate = true;
    cityList.add(City(1,'Lashio'));
    cityList.add(City(2,'Mandalay'));
    cityList.add(City(3,"Yangon"));
  }

  isWritingTo(bool val){
    isWriting = val;
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
                          cityList.add(City(1,controller.text.toString()));
                        }else{
                          cityList.removeAt(index);
                          cityList.insert(index, City(cityList[index].cityId, controller.text.toString()));
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
}
