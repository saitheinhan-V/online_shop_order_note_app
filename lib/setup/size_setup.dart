import 'package:flutter/material.dart';
import 'package:order_app/common/global.dart';
import 'package:order_app/dao/size_dao.dart';
import 'package:order_app/models/size.dart';


class SizeSetupPage extends StatefulWidget {
 @override
  State<StatefulWidget> createState() => _SizeSetupPageState();

}

class _SizeSetupPageState extends State<SizeSetupPage> {
  List<ItemSize> sizeList=new List<ItemSize>();
  FocusNode focusNode= new FocusNode();
  TextEditingController controller=new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String sizeName="";
  ItemSize itemSize;
  SizeDao sizeDao;


  @override
  void initState() {
    // TODO: implement initState
    getDatabase();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            addNewSize(-1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
        child: ListView.builder(
          itemCount: sizeList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onDoubleTap: (){
                setState(() {
                  addNewSize(index);
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(sizeList[index].sizeName,
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

  addNewSize(int index) {

    if(index >= 0){
      sizeName = sizeList[index].sizeName;
      if(sizeName.isNotEmpty){
        controller.text = sizeName;
      }
    }else{
      controller.text = "";
    }

    return showDialog(
        context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx){
          return AlertDialog(
            title: Text("New Size Entry"),
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
                            return 'Enter Size Name';
                          }
                          return null;
                        },
                        autofocus: true,
                        focusNode: focusNode,
                        controller: controller,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Size Name',
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
                          itemSize =ItemSize(null,controller.text.toString());
                          sizeDao.insertSize(itemSize);
                          sizeList.add(itemSize);
                        }else{
                          int id =sizeList[index].sizeId;
                          itemSize =ItemSize(id, controller.text.toString());
                          sizeDao.updateSize(itemSize);
                          sizeList.removeAt(index);
                          sizeList.insert(index,itemSize);
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
    sizeDao = Global.database.sizeDao;
    sizeList = await sizeDao.findAllSize();
    int count =sizeList.length;
    print("Item Size List Size : $count");
    setState(() {});
  }
}
