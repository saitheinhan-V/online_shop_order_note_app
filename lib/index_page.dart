import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:order_app/ui/tab/customer_setup.dart';
import 'package:order_app/ui/tab/expense_entry.dart';
import 'package:order_app/ui/tab/order_note.dart';
import 'package:order_app/ui/tab/payment_order_check.dart';
import 'package:order_app/ui/tab/setting.dart';



class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> with SingleTickerProviderStateMixin{

  var _pageController = PageController();
  int _selectedIndex = 0;
  DateTime _lastPressed;
  final List<Widget> pages = [
    OrderNotePage(),CustomerSetupPage(),PaymentOrderCheckPage(),ExpenseEntryPage(),SettingPage()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        iconSize: 20,
        selectedFontSize: 15.0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            title: Text('Order')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind),
            title: Text('Customer')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add_check),
            title: Text('Check')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_add),
            title: Text('Expense')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Setup')
          )
        ],
      ),

    );



  }
}

