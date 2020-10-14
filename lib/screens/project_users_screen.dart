import 'package:flutter/material.dart';
import '../widgets/widget_connect.dart';
import './home_screen.dart';

class GetProjectAndUsersScreen extends StatelessWidget {
  static const routeName = '/getProjectAndUser';



  @override
  Widget build(BuildContext context) {

    final double _screenheight = MediaQuery
        .of(context)
        .size
        .height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Get Project- and User info ',
            style: TextStyle(fontSize: 13),
          ),
        leading: new IconButton(
        icon: new Icon(Icons.arrow_back),
        onPressed: () =>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
      ),
        ),
        body:
        SingleChildScrollView(
          child: Container(
              margin: EdgeInsets.all(5.0),
              child:Connect(),
              )
          )
        ),
    );
  }
}
