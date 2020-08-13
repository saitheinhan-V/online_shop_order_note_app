import 'package:flutter/material.dart';

class CustomerSetupPage extends StatefulWidget {

  @override
  _CustomerSetupPageState createState() => _CustomerSetupPageState();
}

class _CustomerSetupPageState extends State<CustomerSetupPage> {

  final _formKey= GlobalKey<FormState>();

  TextEditingController nameController = new TextEditingController();
  FocusNode focusNode=new FocusNode();

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
                child: TextFormField(
                  validator: (value){
                    if(value.isEmpty){
                      return 'Enter Name';
                    }
                    return null;
                  },
                  autofocus: true,
                  focusNode: focusNode,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Name',
                  ),
                ),
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
          return AlertDialog(
            title: Text("New City Entry"),
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

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                          autofocus: true,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                          autofocus: true,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                          autofocus: true,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        child: TextFormField(
                          validator: (value){
                            if(value.isEmpty){
                              return 'Enter Name';
                            }
                            return null;
                          },
                          autofocus: true,

                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Name',
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








