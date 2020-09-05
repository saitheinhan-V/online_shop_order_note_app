import 'package:flutter/material.dart';

class CustomerSetupPage extends StatefulWidget {

  @override
  _CustomerSetupPageState createState() => _CustomerSetupPageState();
}

class _CustomerSetupPageState extends State<CustomerSetupPage> {

  final _formKey= GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController socialController = new TextEditingController();
  FocusNode focusNode=new FocusNode();

  List<String> genderStatus = ['Male','Female','Others'];
  List<String> city = ['Yangon','Mandalay'];
  List<String> customerList = [];

  String genderValue = 'Male';
  String cityName = 'Yangon';

  String name = "";

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            newEntryDialog();
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 400.0,
                margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
                child: customerList.length!=0? ListView.builder(
                    itemCount: customerList.length,
                    itemBuilder: (context,index){
                      return GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 35.0,
                          margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.grey
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                margin: EdgeInsets.only(top: 0.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: Text(customerList[index].toString())),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: Text('Yangon')),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
                : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  newEntryDialog(){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx){

          genderValue = 'Male';
          cityName = 'Yangon';

          return AlertDialog(
            title: Text("New Customer Entry"),
            content: Container(
              height: 200.0,
              child: Form(
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: DropdownButton<String>(
                          value: genderValue,
                          icon: Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          iconSize: 24,
                          style: TextStyle(color: Colors.blue,fontSize: 15),
                          onChanged: (String data){
                            setState(() {
                              genderValue = data;
                            });
                          },
                          items: genderStatus.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Phone Number';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: phoneController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child:  DropdownButton<String>(
                          value: cityName,
                          icon: Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          iconSize: 24,
                          style: TextStyle(color: Colors.blue,fontSize: 15),
                          onChanged: (String data){
                            setState(() {
                              cityName = data;
                            });
                          },
                          items: city.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Social Media';
                            }
                            return null;
                          },
                          autofocus: true,
                          controller: socialController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Social Account',
                          ),
                        ),
                      ),
                    ],
                  ),
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
                      count = count +1;
                      name = nameController.text.toString();
                      customerList.add(name);
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

class TextField extends StatefulWidget {
  @override
  _TextFieldState createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}








