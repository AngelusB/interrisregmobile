import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class FeatureDetail extends StatefulWidget {
  static const routeName = '/featureDetailScreen';

  FeatureDetail({this.feature, this.unit, this.isNewRecord});

  Feature feature;

  Unit unit;
  bool isNewRecord;

  @override
  _FeatureDetailState createState() => _FeatureDetailState();
}

class _FeatureDetailState extends State<FeatureDetail> {
  TextEditingController _tcFeatureName;
  TextEditingController _tcFeatureRemark;
  TextEditingController _tcDateBegin;
  TextEditingController _tcDateEnd;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RefFeatureType _featureType;
  RefFeatureConservation _featureConservation;
  RefPeriod _refPeriod;

  String _appbarText = 'Feature ';
  List<DropdownMenuItem<RefFeatureType>> _itemsFeatureType = [];
  List<RefFeatureType> _listRefFeatureType = [];

  List<DropdownMenuItem<RefFeatureConservation>> _itemsConservation = [];
  List<RefFeatureConservation> _listRefConservation = [];

  RefFeatureType _makeEmptyFeatureType(String value) {
   return RefFeatureType(
      F_FEATURE_TYPE: value,
      F_DESCRIPTION: value,
    );

  }
  RefFeatureConservation _makeEmptyFeatureConservation(String value) {
    return RefFeatureConservation(F_FEATURE_CONSERVATION:"", F_DESCRIPTION: "");
  }

  RefPeriod _makeEmptyPeriod(String value) {
    return  RefPeriod(F_PERIOD: '', F_DESCRIPTION: '');

  }


  @override
  void initState() {
    super.initState();
    if (widget.feature != null) {
      _tcFeatureName = TextEditingController(text: widget.feature.F_FEATURE);
      _tcFeatureRemark = TextEditingController(text: widget.feature.F_REMARK);
      _tcDateBegin =
          TextEditingController(text: widget.feature.F_DATE_BEGIN.toString());
      _tcDateEnd =
          TextEditingController(text: widget.feature.F_DATE_END.toString());
    }
    _appbarText = 'Feature  -  unit: ' + widget.unit.F_UNIT;

    final db = Provider.of<InterrisDatabase>(context, listen: false);

    // ==== DropBox refFeatureType ===================================
    db.refFeatureTypeDao.getAllRefFeatureTypeOrdered().then((value) {
      _listRefFeatureType = value;
      _listRefFeatureType.insert(0, _makeEmptyFeatureType("matrix"));
      _listRefFeatureType.insert(0, _makeEmptyFeatureType(""));

      setState(() {
        _itemsFeatureType = _listRefFeatureType.map((RefFeatureType item) {
          return DropdownMenuItem<RefFeatureType>(
              value: item,
              child: SizedBox(
                width: 200,
                child: Text(item.F_DESCRIPTION),
              ));
        }).toList();

        _featureType = _makeEmptyFeatureType("");
        if (widget.feature.F_FEATURE_TYPE.isNotEmpty) {
          for (RefFeatureType ref in _listRefFeatureType) {
            if (ref.F_FEATURE_TYPE == widget.feature.F_FEATURE_TYPE) {
              _featureType = ref;
              break;
            }
          }
        }
      });// setState
    });
   // ==== DropBox refFeaturConservation  ===================================
    db.refFeatureConservationDao.getAllRefFeatureConservationOrdered().then((value) {
      _listRefConservation = value;

      _listRefConservation.insert(0, _makeEmptyFeatureConservation(""));

      setState(() {
      _itemsConservation= _listRefConservation.map((RefFeatureConservation item) {
      return DropdownMenuItem<RefFeatureConservation>(
          value: item,
          child: SizedBox(
            width: 200,
            child: Text(item.F_DESCRIPTION),
          ));
    }).toList();

    _featureConservation = _makeEmptyFeatureConservation("");
    if (widget.feature.F_FEATURE_CONSERVATION.isNotEmpty) {
      for (RefFeatureConservation ref in _listRefConservation) {
        if (ref.F_FEATURE_CONSERVATION == widget.feature.F_FEATURE_CONSERVATION) {
          _featureConservation = ref;
          break;
        }
      }
    }
      });// setState
    });
          }

  void _insertNewRecord(BuildContext ctx, Feature feature) {
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    /*
    String id = lib.getId();
    lib.markRecord().then((value) {
      db.featureDao.insertFeature(feature.copyWith(
          F_FEATURE_ID: id,
          F_UNIT_ID: _tcFeatureName.text,
          F_PLANUM_TYPE:  _featureType,
          F_BEGIN_DATE: _tcBeginDate.text,
          F_END_DATE:_tcEndDate.text ,
          F_REMARK: _tcFeatureRemark.text,
          F_RECORDER: value.F_RECORDER,
          F_PROJECT_ID: value.F_PROJECT_ID,
          F_RECORD_TIME: value.F_RECORD_TIME,
          changed: false,
          inserted: true));
    });

     */
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            _appbarText,
            style: TextStyle(fontSize: 18),
          ),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(children: <Widget>[
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcFeatureName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Feature name",
                  ),
                )),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('   Feature type '),
                  SizedBox(
                    width: 10,
                  ),
                  DropdownButton<RefFeatureType>(
                    // isExpanded: true,
                    value: _featureType,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (RefFeatureType newValue) {
                      setState(() {
                        _featureType = newValue;
                      });
                    },
                    items: _itemsFeatureType,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcDateBegin,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Begin date",
                  ),
                )),
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcDateEnd,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "End date",
                  ),
                )),
            Container(
                margin: EdgeInsets.all(18),
                child: TextField(
                  controller: _tcFeatureRemark,
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
                      ? _insertNewRecord(context, widget.feature)
                      : lib.markRecord().then((value) =>
                          db.featureDao.updateFeature(widget.feature.copyWith(
                              /*


        F_BEGIN_PERIOD:"",
        F_END_PERIOD:"",
        F_REJECTED:false,
        F_CONTROL:"",
        F_FEATURE_CONSERVATION:"",
        F_Z_BOTTOM:"",
        F_FEATURE_DEPTH:"",
        F_Z_TOP:"",
        F_REMARK: "",
        F_PROJECT_ID: "",
        F_RECORD_TIME: 0,
        F_RECORDER: "");
                             */
                              F_FEATURE: _tcFeatureName.text,
                              F_FEATURE_TYPE: _featureType.F_FEATURE_TYPE,
                              F_DATE_BEGIN: int.parse(_tcDateBegin.text),
                              F_DATE_END: int.parse(_tcDateEnd.text),
                              F_BEGIN_PERIOD:"",
                              F_END_PERIOD:"",
                              F_REJECTED:false,
                              F_REMARK: _tcFeatureRemark.text,
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
        ));
  }
}
