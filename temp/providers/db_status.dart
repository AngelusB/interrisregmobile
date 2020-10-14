import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbStatus with ChangeNotifier {

  final BuildContext context;
  DbStatus(this.context);



int _getNrOfUsers=-1;

int get getNrOfUsers{
   return _getNrOfUsers;
}


Future<int> getUsers()  async{
  var _countUsers=0;
  var dbDir = await getDatabasesPath();
  var db = await openDatabase( join(await getDatabasesPath(), 'interrisreg.db'));
  int count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM Users'));

 _getNrOfUsers=count;
 return count;
}




}
