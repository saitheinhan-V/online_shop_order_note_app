import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/index_page.dart';
import 'package:order_app/setup/account_setup.dart';
import 'package:order_app/setup/city_setup.dart';
import 'package:order_app/setup/color_setup.dart';
import 'package:order_app/setup/expense_setup.dart';
import 'package:order_app/setup/gender_setup.dart';
import 'package:order_app/setup/size_setup.dart';

class SettingPage extends StatefulWidget {

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  static List<Setup> _setup = <Setup>[
    Setup(title: 'Account', icon: Icons.person_pin, widget: AccountSetupPage()),
    Setup(title: 'City', icon: Icons.location_city, widget: CitySetupPage()),
    Setup(title: 'Color', icon: Icons.color_lens, widget: ColorSetupPage()),
    Setup(title: 'Gender', icon: Icons.people_outline, widget: GenderSetupPage()),
    Setup(title: 'Size', icon: Icons.format_size, widget: SizeSetupPage()),
    Setup(title: 'Expense', icon: Icons.alarm_add, widget: ExpenseSetupPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
          itemCount: _setup.length,
          itemBuilder: (context,index){
            return new Card(
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => _setup[index].widget));
                },
                child: new GridTile(
                  footer: Container(
                    margin: EdgeInsets.only(top: 5.0,bottom: 10.0),
                      child: Center(child: new Text(_setup[index].title))),
                  child: new Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Center(
                      child: Icon(_setup[index].icon,size: 80.0,color: Colors.blueAccent,),
                    ),
                  ), //just for testing, will fill with image later
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,)
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

class Setup {
  final String title;
  final IconData icon;
  final Widget widget;

  const Setup({this.title, this.icon, this.widget});
}

