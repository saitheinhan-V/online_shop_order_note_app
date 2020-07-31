import 'package:flutter/material.dart';
import 'package:order_app/models/color.dart';


class ColorSetupPage extends StatefulWidget {
 @override
  State<StatefulWidget> createState() => _ColorSetupPageState();

}

class _ColorSetupPageState extends State<ColorSetupPage> {

  List<Color> colorList=new List<Color>();

  FocusNode focusNode= new FocusNode();
  TextEditingController controller=new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String colorName="";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    colorList.add(Color(1,'Yellow'));
    colorList.add(Color(2,'Red'));
    colorList.add(Color(3,"Green"));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            addNewColor(-1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
        child: ListView.builder(
          itemCount: colorList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onDoubleTap: (){
                setState(() {
                  addNewColor(index);
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(colorList[index].colorName,
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

  addNewColor(int index) {

    if(index >= 0){
      colorName = colorList[index].colorName;
      if(colorName.isNotEmpty){
        controller.text = colorName;
      }
    }else{
      controller.text = "";
    }

    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx){
          return AlertDialog(
            title: Text("New Color Entry"),
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
                            return 'Enter Color Name';
                          }
                          return null;
                        },
                        autofocus: true,
                        focusNode: focusNode,
                        controller: controller,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Color Name',
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
                          colorList.add(Color(1,controller.text.toString()));
                        }else{
                          colorList.removeAt(index);
                          colorList.insert(index, Color(colorList[index].colorId, controller.text.toString()));
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
