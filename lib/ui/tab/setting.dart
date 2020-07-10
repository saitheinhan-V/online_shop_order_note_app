import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 5,
            itemBuilder: (context,index){
            return SetupList();
            },
        ),
      ),
    );
  }
}

class SetupList extends StatefulWidget {
  @override
  _SetupListState createState() => _SetupListState();
}

class _SetupListState extends State<SetupList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Text('Account'),
          Text('Colors'),
          Text('Size'),
          Text('City')
        ],
      ),
    );
  }
}

