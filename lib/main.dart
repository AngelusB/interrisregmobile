import 'package:flutter/material.dart';
import 'dart:async';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/project_users_screen.dart';
import './screens/splash_screen.dart';
import './screens/home_screen.dart';
//import './screens/unit_list_screen.dart';
import './screens/unit_list_screen.dart';
import  './screens/planum_list_screen.dart';
import  './screens/feature_list_screen.dart';
import './helpers/custom_route.dart'; //animation
import './data/moor_database.dart';


void main() {
  runApp(
    Provider<InterrisDatabase>(
      create: (context) => InterrisDatabase(),
      child: MyApp(),
      dispose: (context, db) => db.close(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

int noUsers=-1;


class _MyAppState extends State<MyApp> {


  Future<int> _countUsers(BuildContext ctx) async {

    final database = Provider.of<InterrisDatabase>(ctx, listen: false);
    try {
      database.userDao.countUsers().then((value) {
        setState(() {
          noUsers=value;
        });
        return value;

      } );
    } catch (error) {
      return -1;
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'INTERRIS-REGISTER',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransitionBuilder(),
            TargetPlatform.iOS: CustomPageTransitionBuilder(),
          },
        ),
      ),
      home: FutureBuilder<int>(
        future:noUsers==-1 ?  _countUsers(context) : null, // a
        builder: (ctx, snapshot) => (snapshot.data == 0 || noUsers == -1)
            ? SplashScreen()
            : (noUsers == 0 ? GetProjectAndUsersScreen() : LoginScreen()),
      ),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        GetProjectAndUsersScreen.routeName: (ctx) => GetProjectAndUsersScreen(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        UnitListing.routeName:(ctx) => UnitListing(),
        PlanumListing.routeName:(ctx) => PlanumListing(),
        FeatureListing.routeName:(ctx) => FeatureListing(),
      },
    );
  }
}
