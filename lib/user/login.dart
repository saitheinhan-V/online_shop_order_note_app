import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:order_app/index_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController phoneController;
  TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Image.asset('assets/online-shop.png',width: 120.0,height: 120.0,fit: BoxFit.cover,),
            ),
            SizedBox(height: 50.0,),
            TextFormField(
              controller: phoneController,
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.grey, size: 22),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Phone number',
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              controller: passwordController,
              autofocus: true,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 22),
                hintStyle: TextStyle(fontSize: 16),
                hintText: 'Password',
              ),
            ),
            SizedBox(height: 20.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => IndexPage()));
              },
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  color: Colors.blueAccent,
                ),
                child: Center(
                  child: Text('Sign In',style: TextStyle(color: Colors.white),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
