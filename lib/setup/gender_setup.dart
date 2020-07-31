import 'package:flutter/material.dart';
import 'package:order_app/models/gender.dart';


class GenderSetupPage extends StatefulWidget {
 @override
  State<StatefulWidget> createState() => _GenderSetupPageState();

}

class _GenderSetupPageState extends State<GenderSetupPage> {

  List<Gender> genderList=new List<Gender>();

  FocusNode focusNode= new FocusNode();
  TextEditingController controller=new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String genderName="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genderList.add(Gender(1,'Male'));
    genderList.add(Gender(2,'Female'));
    genderList.add(Gender(3,"Other"));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gender'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            addNewGender(-1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
        child: ListView.builder(
          itemCount: genderList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onDoubleTap: (){
                setState(() {
                  addNewGender(index);
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(genderList[index].genderName,
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

  addNewGender(int index) {

    if(index >= 0){
      genderName = genderList[index].genderName;
      if(genderName.isNotEmpty){
        controller.text = genderName;
      }
    }else{
      controller.text = "";
    }

    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx){
          return AlertDialog(
            title: Text("New Gender Entry"),
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
                            return 'Enter Gender Name';
                          }
                          return null;
                        },
                        autofocus: true,
                        focusNode: focusNode,
                        controller: controller,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Gender Name',
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
                          genderList.add(Gender(1,controller.text.toString()));
                        }else{
                          genderList.removeAt(index);
                          genderList.insert(index, Gender(genderList[index].genderId, controller.text.toString()));
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
