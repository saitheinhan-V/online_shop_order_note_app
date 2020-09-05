import 'package:flutter/material.dart';

class OrderNotePage extends StatefulWidget {

  @override
  _OrderNotePageState createState() => _OrderNotePageState();
}

class _OrderNotePageState extends State<OrderNotePage> {

  List<String> orderStatus = ['Ordered','Packaged','Sent'];

  String statusValue = 'Ordered';

  DateTime finalDate= DateTime.now();

  void callDatePicker() async{
    var order = await getDate();
    setState(() {
      finalDate = order;
    });
  }

  Future<DateTime> getDate(){
    return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
      builder: (BuildContext context, Widget child){
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){},
              icon: Icon(Icons.search,color: Colors.white,),
              label: Text(''))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 70.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40.0,
                      margin: EdgeInsets.fromLTRB(5.0,0.0, 5.0, 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
                          value: statusValue,
                          icon: Icon(Icons.arrow_drop_down),
                          elevation: 16,
                          iconSize: 24,
                          style: TextStyle(color: Colors.blue,fontSize: 18),
                          onChanged: (String data){
                            setState(() {
                              statusValue = data;
                            });
                          },
                          items: orderStatus.map<DropdownMenuItem<String>>((String value){
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          callDatePicker();
                        });
                      },
                      child: Container(
                        height: 40.0,
                        margin: EdgeInsets.fromLTRB(5.0,0.0, 5.0, 0.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(child: Text(finalDate.toString())),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 400.0,
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 10.0),
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 70.0,
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
                                    child: Center(child: Text('OrderID - 000001')),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('50000 Ks')),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 30.0,
                              margin: EdgeInsets.only(top: 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Sai Thein Han')),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Center(child: Text('Ordered')),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
