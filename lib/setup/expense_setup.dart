import 'dart:math';

import 'package:flutter/material.dart';
import 'package:order_app/common/global.dart';
import 'package:order_app/dao/expense_dao.dart';
import 'package:order_app/models/expense.dart';


class ExpenseSetupPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ExpenseSetupPageState();

}

class _ExpenseSetupPageState extends State<ExpenseSetupPage> {
  List<Expense> expenseList=new List<Expense>();
  FocusNode focusNode= new FocusNode();
  TextEditingController controller=new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String expenseName="";
  ExpenseDao expenseDao;
  Expense expense;


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
        title: Text('Expense'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            addNewExpense(-1);
          });
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0,left: 20.0,right: 20.0,bottom: 10.0),
        child: ListView.builder(
          itemCount: expenseList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onDoubleTap: (){
                setState(() {
                  addNewExpense(index);
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Column(
                  children: <Widget>[
                    Text(expenseList[index].expenseName,
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

  addNewExpense(int index) {

    if(index >= 0){
      expenseName = expenseList[index].expenseName;
      if(expenseName.isNotEmpty){
        controller.text = expenseName;
      }
    }else{
      controller.text = "";
    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx){
          return AlertDialog(
            title: Text("New Expense Entry"),
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
                            return 'Enter Expense Name';
                          }
                          return null;
                        },
                        autofocus: true,
                        focusNode: focusNode,
                        controller: controller,
                        maxLength: 20,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Expense Name',
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
                        expense =Expense(null,controller.text.toString());
                        expenseDao.insertExpense(expense);
                        expenseList.add(expense);
                      }else{
                        int id =expenseList[index].expenseId;
                        expense =Expense(id, controller.text.toString());
                        expenseDao.updateExpense(expense);
                        expenseList.removeAt(index);
                        expenseList.insert(index,expense);
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
    expenseDao = Global.database.expenseDao;
    expenseList = await expenseDao.findAllExpense();
    int count = expenseList.length;
    print("Expense List Size : $count");
    setState(() {});
  }
}
