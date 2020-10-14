import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class PlanumDetail extends StatefulWidget {
  static const routeName = '/planumDetailScreen';

  PlanumDetail({this.planum,this.unit, this.isNewRecord});

  Planum planum ;
  Unit unit;
  bool isNewRecord ;


  @override
  _PlanumDetailState createState() => _PlanumDetailState();
}

class _PlanumDetailState extends State<PlanumDetail> {
  TextEditingController _tcPlanumName;
  TextEditingController _tcPlanumRemark;
  TextEditingController _tcBeginDate;
  TextEditingController _tcEndDate;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _planumType= 'Planum';
  String _appbarText='Planum ';

  DropdownMenuItem<String> list;

  @override
  void initState() {
    super.initState();
    if (widget.planum != null) {
      _tcPlanumName = TextEditingController(text: widget.planum.F_PLANUM);
      _tcPlanumRemark = TextEditingController(text: widget.planum.F_REMARK);
      _tcBeginDate = TextEditingController(text: widget.planum.F_BEGIN_DATE);
      _tcEndDate = TextEditingController(text: widget.planum.F_END_DATE);
      _planumType=widget.planum.F_PLANUM_TYPE;
    }
    _appbarText='Planum  -  unit: '+widget.unit.F_UNIT;

  }

  void _insertNewRecord(BuildContext ctx,Unit unit, Planum planum) {
    SharedPreferences prefs;

    final db = Provider.of<InterrisDatabase>(context, listen: false);
    String id = lib.getId();
    lib.markRecord().then((value) {
      db.planumDao.insertPlanum(planum.copyWith(
          F_PLANUM_ID: id,
          F_UNIT_ID: unit.F_UNIT_ID,
          F_PLANUM: _tcPlanumName.text,
          F_PLANUM_TYPE:  _planumType,
          F_BEGIN_DATE: _tcBeginDate.text,
          F_END_DATE:_tcEndDate.text ,
          F_REMARK: _tcPlanumRemark.text,
          F_RECORDER: value.F_RECORDER,
          F_PROJECT_ID: value.F_PROJECT_ID,
          F_RECORD_TIME: value.F_RECORD_TIME,
          changed: false,
          inserted: true));
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(_appbarText,

            style: TextStyle(fontSize: 18),
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body:SingleChildScrollView(

          child: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcPlanumName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Planum name",
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('    Planum type '),
                  SizedBox(width: 40,),
                  DropdownButton<String>(
                    value:  _planumType,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        _planumType= newValue;
                      });
                    },
                    items: <String>['Planum', 'Profile']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),


            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcBeginDate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Begin date",
                  ),
                )),
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcEndDate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "End date",
                  ),
                )),
                Container(
                    margin: EdgeInsets.all(18),
                    child: TextField(
                      controller: _tcPlanumRemark,
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
                      ? _insertNewRecord(context,widget.unit, widget.planum)
                      : lib.markRecord().then((value) =>
                          db.planumDao.updatePlanum(widget.planum.copyWith(
                              F_PLANUM: _tcPlanumName.text,
                              F_PLANUM_TYPE:  _planumType,
                              F_BEGIN_DATE: _tcBeginDate.text,
                              F_END_DATE:_tcEndDate.text ,
                              F_REMARK: _tcPlanumRemark.text,
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
          ])),
        )
    );
  }
}
