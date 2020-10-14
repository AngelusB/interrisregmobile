library lib;
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/unit.dart';
import '../models/planum.dart';
import '../data/moor_database.dart';



const double tekstMarge=10.0;
const cInterrisPrefs="interrisprefs";
const PREFS_ServIp= "ServIpAddress";
const PREFS_ProjectName= "PrevsProjectName";
const PREFS_ProjectCode= "PrevsProjectCode";
const PREFS_ProjectId= "PrevsProjectId";
const PREFS_Username="username";
const PREFS_Password="password";
const PREFS_Language="language";
bool isConnected=false;
//final StreamController<IUnit> currentUnit=StreamController<IUnit>();

String currentProjectId='';
String currentUser='';

Future<IUnit> markRecord () async{
  SharedPreferences prefs;
  prefs = await SharedPreferences.getInstance();
  String proj =prefs.getString(PREFS_ProjectId);
  String user =prefs.getString(PREFS_Username);
  int rectime=(DateTime.now().toUtc().millisecondsSinceEpoch/1000).round();
  IUnit unit=IUnit('','','',user,rectime,proj);
  return unit;
}

 void makeDefaultPlanum (BuildContext ctx, Unit unit){
  /*
       FieldByName(F_UNIT_ID).AsString := PutId;
                FieldByName(F_PLANUM_ID).AsString := VlakId;
                FieldByName(F_PLANUM).AsString := VlakNaam;
                WITH FDataMod DO
                  FieldByName(F_REMARK).AsString := ReadProjectProfileItem('frmVlakken', Global.CurrentProfileID,
                    Global.ProjectId, 'tAL_Panel2.DefaultOpmerking', '');

                FieldByName(F_PLANUM_TYPE).AsString := F_PLANUM; // RFC2015_070
   */
   final db = Provider.of<InterrisDatabase>(ctx, listen: false);
   Planum planum ;
   markRecord().then((value) =>
   db.planumDao.insertPlanum(planum.copyWith(
     F_UNIT_ID: unit.F_UNIT_ID,
     F_PLANUM_ID: getId(),
     F_PLANUM: '0',
     F_PLANUM_TYPE: 'F_PLANUM',
     F_BEGIN_DATE:'',
     F_END_DATE: '',
     F_REMARK: '',
     F_RECORDER: value.F_RECORDER,
     F_RECORD_TIME: value.F_RECORD_TIME,
     F_PROJECT_ID: value.F_PROJECT_ID
   )));


 }

 String getId() {
    DateTime dt =DateTime.now();
    int seconds = dt.millisecondsSinceEpoch;
    double f = seconds.toDouble();
    String s = "";
    s = Maakletters(f);
    return s;
  }

String Maakletters(double cijfer) {
  String s = "";
  int rest;
  while (cijfer >= 1) {
    rest = Modulus(cijfer, 26);
    cijfer = Divisor(cijfer, 26);

    s =String.fromCharCode(rest+65)+s;
        //(Character.toString((char) (rest + 65))) + s;

  }
  rest = Modulus(cijfer, 26);
  s = String.fromCharCode(rest+65)+ s;
  return s;
}

int Modulus(double cijfer, int deler) {
  double temp;
  if (deler > 0) {
    temp = cijfer % deler;
  } else {
    temp = 3;
  }
  return temp.round();
}

double Divisor(double cijfer, int deler) {
  double r;
  if (deler > 0) {
    r = cijfer / deler;
  } else {
    r = cijfer;
  }
  return r;
}





class AlertDialog extends StatelessWidget {
  const AlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Delete'),
      content: const Text('Delete'),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            // Navigator.pop(context, false);
            Navigator.of(
              context,
              // rootNavigator: true,
            ).pop(false);
          },
          child: const Text('No'),
        ),
        FlatButton(
          onPressed: () {
            // Navigator.pop(context, true);
            Navigator.of(
              context,
              // rootNavigator: true,
            ).pop(true);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}