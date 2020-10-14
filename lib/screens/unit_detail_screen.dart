import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class UnitDetail extends StatefulWidget {
  static const routeName = '/unitDetailScreen';

  UnitDetail({this.unit, this.isNewRecord});

  Unit unit = null;
  bool isNewRecord = false;

  @override
  _UnitDetailState createState() => _UnitDetailState();
}

class _UnitDetailState extends State<UnitDetail> {
  TextEditingController textControllerUnitName;

  TextEditingController textControllerUnitRemark;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (widget.unit != null) {
      textControllerUnitName = TextEditingController(text: widget.unit.F_UNIT);
      textControllerUnitRemark =
          TextEditingController(text: widget.unit.F_REMARK);
    }
  }

  void _insertNewRecord(BuildContext ctx, Unit unit) {
    SharedPreferences prefs;

    final db = Provider.of<InterrisDatabase>(context, listen: false);
    String id = lib.getId();
    lib.markRecord().then((value) {
      db.unitDao.insertUnit(unit.copyWith(
          F_UNIT_ID: id,
          F_UNIT: textControllerUnitName.text,
          F_REMARK: textControllerUnitRemark.text,
          F_RECORDER: value.F_RECORDER,
          F_PROJECT_ID: value.F_PROJECT_ID,
          F_RECORD_TIME: value.F_RECORD_TIME,
          changed: false,
          inserted: true));
      db.unitDao.getUnit(id).then((value) => lib.makeDefaultPlanum(ctx, value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Unit',
            style: TextStyle(fontSize: 18),
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(18),
              child: TextField(
                controller: textControllerUnitName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Unit name",
                ),
              )),
          Container(
              margin: EdgeInsets.all(18),
              child: TextField(
                controller: textControllerUnitRemark,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Remark",
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                widget.isNewRecord
                    ? _insertNewRecord(context, widget.unit)
                    : lib.markRecord().then((value) => db.unitDao.updateUnit(
                        widget.unit.copyWith(
                            F_UNIT: textControllerUnitName.text,
                            F_REMARK: textControllerUnitRemark.text,
                            F_RECORDER: value.F_RECORDER,
                            F_PROJECT_ID: value.F_PROJECT_ID,
                            F_RECORD_TIME: value.F_RECORD_TIME,
                            changed: true)));

                _scaffoldKey.currentState
                    .showSnackBar(SnackBar(content: Text('Record saved')));
                Navigator.pop(context);
              },
              child: Text('Submit'),
            ),
          ),
        ])));
  }
}
