import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../models/projectinfo.dart';
import '../models/unit.dart';
import '../models/planum.dart';
import '../models/feature.dart';
import '../models/reffeaturetype.dart';
import '../models/reffeatureconservation.dart';
import '../models/refperiod.dart';
import '../librar/library.dart' as lib;
import '../helpers/exceptions.dart';
import '../data/moor_database.dart';

class Connect extends StatefulWidget {
  @override
  _ConnectState createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final _formKey = GlobalKey<FormState>();
  static SharedPreferences _preferences;
  List<IUser> _usersList = [];
  List<IUnit> _unitsList = [];
  List<IPlanum> _planaList = [];
  List<IFeature> _featureList = [];
  List<IRefFeatureType> _reffeaturetypeList = [];
  List<IRefFeatureConservation> _reffeatureconservationList = [];
  List<IRefPeriod> _refperiodList = [];
  String _IpAdress = "";
  String _projectName = "";
  var IpController = new TextEditingController();
  var _userNo = 0;
  var _unitNo = 0;
  var _planumNo = 0;
  var _featureNo = 0;
  var _reffeaturetypeNo=0;
  var _reffeatureConservationNo=0;
  var _refperiodNo=0;
  int _countUnits = 0;

  String _message = "";
  String _connectionMsg = 'not connected';

  bool _getTablesEnabled = false;

  static String getPrefString(SharedPreferences pref, String key,
      {String defValue = ''}) {
    if (pref == null) return defValue;
    return pref.getString(key) ?? defValue;
  }

  Future<void> init() async {
    final database = Provider.of<InterrisDatabase>(context, listen: false);
    //_userNo (number of users)
    //============================================
    try {
      database.userDao.countUsers().then((value) {
        setState(() {
          _userNo = value;
        });
      });
      //Ip Address & ProjectName
      //============================================================
      _preferences = await SharedPreferences.getInstance();
      setState(() {
        _getTablesEnabled = lib.isConnected && _userNo > 0;
        IpController.text = getPrefString(_preferences, lib.PREFS_ServIp);
        _projectName = getPrefString(_preferences, lib.PREFS_ProjectName);
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  void setConnectionString() {
    String _con;
    if (lib.isConnected) {
      _con = 'connected to IP Address ' + _IpAdress;
    } else {
      _con = 'not connected';
    }
    setState(() {
      _connectionMsg = _con;
    });
  }

  ProjectInfo parseProject(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<ProjectInfo> list =
        parsed.map<ProjectInfo>((json) => ProjectInfo.fromJson(json)).toList();
    if (list.length > 0) {
      return list[0];
    } else
      return null;
  }

  List<IUser> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<IUser>((json) => IUser.fromJson(json)).toList();
  }

  Future<ProjectInfo> fetchProjectInf(String _ip) async {
    try {
      final String url = 'http://' + _ip + ':8080/projects';
      final response = await http.get(url);

      switch (response.statusCode) {
        case 200:
          var responseJson = json.decode(response.body.toString());
          print(response.statusCode.toString());
          // _sharedPreferences = await _preferences.getInstance();
          _preferences.setString(lib.PREFS_ServIp, _ip);
          return parseProject(response.body);
        case 400:
          throw BadRequestException(response.body.toString());
        case 401:
        case 403:
          throw UnauthorisedException(response.body.toString());
        case 500:
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<IUser>> fetchUsers(String _ip) async {
    final String url = 'http://' + _ip + ':8080/userinfo';
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        return parseUsers(response.body);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Kan project niet laden');
      }
    } catch (error) {
      print(error.toString());
    }
  }

  void validateAndSaveProjectAndPersons(BuildContext context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        fetchProjectInf(_IpAdress).then((value) => setState(() {
              _projectName = value.F_PROJECT_NAME;
              lib.isConnected = true;
              //_sharedPreferences = await _sharedPreferences.getInstance();
              _preferences.setString(lib.PREFS_ProjectName, _projectName);
              _preferences.setString(
                  lib.PREFS_ProjectCode, value.F_PROJECT_CODE);
              _preferences.setString(lib.PREFS_ProjectId, value.F_PROJECT_ID);
              setConnectionString();
            }));
      } catch (e, s) {
        print(s);
      }
      // USERS
      //==============================================
      try {
        final db = Provider.of<InterrisDatabase>(context, listen: false);
        fetchUsers(_IpAdress).then((value) {
          db.userDao.deleteAllUsers();
          _usersList = value;
          IUser iuser;
          for (int i = 0; i < _usersList.length - 1; i++) {
            iuser = _usersList[i];
            db.userDao.insertNewUser(User(
                F_PERSON_ID: iuser.F_PERSON_ID,
                F_PERSON: iuser.F_PERSON,
                F_PASSWORD: iuser.F_PASSWORD,
                F_USERNAME: iuser.F_USERNAME));
          }
          setState(() {
            db.userDao.countUsers().then((value) => _userNo = value);
            _getTablesEnabled = lib.isConnected && _userNo > 0;
          });
        });
      } catch (e, s) {
        print(s);
      }
    }
  }

  List<IUnit> parseUnits(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<IUnit>((json) => IUnit.fromJson(json)).toList();
  }

  Future<List<IUnit>> fetchUnits() async {
    final response = await http.get('http://' + _IpAdress + ':8080/trenches');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return parseUnits(response.body);
    } else {
      print(response.statusCode.toString());
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Can \'t load units');
    }
  }

  List<IPlanum> parsePlana(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<IPlanum>((json) => IPlanum.fromJson(json)).toList();
  }

  Future<List<IPlanum>> fetchPlana() async {
    final response = await http.get('http://' + _IpAdress + ':8080/plana');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return parsePlana(response.body);
    } else {
      print(response.statusCode.toString());
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Can \'t load plana');
    }
  }

  List<IFeature> parseFeatures(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<IFeature>((json) => IFeature.fromJson(json)).toList();
  }


  Future<List<IFeature>> fetchFeatures() async {
    final response = await http.get('http://' + _IpAdress + ':8080/features');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      return parseFeatures(response.body);
    } else {
      print(response.statusCode.toString());
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Can \'t load features');
    }
  }

  Future<List<IRefFeatureType>> fetchRefFeaturetype() async {
    final response = await http.get('http://' + _IpAdress + ':8080/reffeaturetypes');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<IRefFeatureType>((json) => IRefFeatureType.fromJson(json)).toList();
    } else {
      throw Exception('Can \'t load features');
    }
  }

  Future<List<IRefFeatureConservation>> fetchRefFeatureConservation() async {
    final response = await http.get('http://' + _IpAdress + ':8080/reffeatureconservations');
    if (response.statusCode == 200) {
     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<IRefFeatureConservation>((json) => IRefFeatureConservation.fromJson(json)).toList();
    } else {
        throw Exception('Can \'t load features');
    }
  }

  Future<List<IRefPeriod>> fetchRefPeriod() async {
    final response = await http.get('http://' + _IpAdress + ':8080/refperiods');
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<IRefPeriod>((json) => IRefPeriod.fromJson(json)).toList();
    } else {
      throw Exception('Can \'t load features');
    }
  }

  void getTables(BuildContext context) {
    fetchUnits().then((value) {
      _unitsList = value;
      final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.unitDao.deleteAllUnits;
      IUnit iunit;
      for (int i = 0; i < _unitsList.length - 1; i++) {
        iunit = _unitsList[i];
        Unit uni = Unit(
          F_UNIT_ID: iunit.F_UNIT_ID,
          F_UNIT: iunit.F_UNIT,
          F_REMARK: iunit.F_REMARK,
          F_RECORDER: iunit.F_RECORDER,
          F_RECORD_TIME: iunit.F_RECORD_TIME == null ? 0 : iunit.F_RECORD_TIME,
          F_PROJECT_ID: iunit.F_PROJECT_ID,
          deleted: false,
        );
        database.unitDao.insertUnit(uni);
      }

      database.unitDao.countUnits().then((value) {
        setState(() {
          _unitNo = value;
          final snackBar =
              SnackBar(content: Text('table Unit with $_unitNo records'));
          Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(snackBar);
        });
      });
    });

    fetchPlana().then((value) {
      final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.planumDao.deleteAllPlanums();
      IPlanum iPlanum;
      _planaList = value;

      for (int i = 0; i < _planaList.length - 1; i++) {
        iPlanum = _planaList[i];
        Planum planum = Planum(
          F_PLANUM_ID: iPlanum.F_PLANUM_ID,
          F_UNIT_ID: iPlanum.F_UNIT_ID,
          F_PLANUM: iPlanum.F_PLANUM,
          F_REMARK: iPlanum.F_REMARK,
          F_RECORDER: iPlanum.F_RECORDER,
          F_RECORD_TIME:
              iPlanum.F_RECORD_TIME == null ? 0 : iPlanum.F_RECORD_TIME,
          F_PROJECT_ID: iPlanum.F_PROJECT_ID,
          F_PLANUM_TYPE: iPlanum.F_PLANUM_TYPE,
          F_BEGIN_DATE: iPlanum.F_BEGIN_DATE,
          F_END_DATE: iPlanum.F_END_DATE,

        );
        database.planumDao.insertPlanum(planum);
      }
      database.planumDao.countPlanums().then((value) {
        setState(() {
          _planumNo = value;
          final snackBar =
              SnackBar(content: Text('table Planum with $_planumNo records'));
          Scaffold.of(context).showSnackBar(snackBar);
        });
      });
    });

    fetchFeatures().then((value) {
      final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.featureDao.deleteAllFeatures();
      IFeature iFeature;
      _featureList = value;

      for (int i = 0; i < _featureList.length - 1; i++) {
        iFeature = _featureList[i];

        Feature feature =Feature(
          F_FEATURE_ID: iFeature.F_FEATURE_ID,
          F_UNIT_ID: iFeature.F_UNIT_ID,
          F_FEATURE: iFeature.F_FEATURE,
          F_FEATURE_TYPE: iFeature.F_FEATURE_TYPE,
          F_DATE_BEGIN: iFeature.F_DATE_BEGIN,
          F_DATE_END: iFeature.F_DATE_END,
          F_BEGIN_PERIOD:iFeature.F_BEGIN_PERIOD ,
          F_END_PERIOD:iFeature.F_END_PERIOD,
          F_REJECTED: iFeature.F_REJECTED,
          F_Z_BOTTOM: iFeature.F_Z_BOTTOM,
          F_Z_TOP:iFeature.F_Z_TOP ,
          F_FEATURE_DEPTH: iFeature.F_FEATURE_DEPTH,
          F_FEATURE_CONSERVATION: iFeature.F_FEATURE_CONSERVATION,
          F_CONTROL: iFeature.F_CONTROL,
          F_REMARK: iFeature.F_REMARK,
          F_RECORDER: iFeature.F_RECORDER,
          F_RECORD_TIME:
          iFeature.F_RECORD_TIME == null ? 0 : iFeature.F_RECORD_TIME,
          F_PROJECT_ID: iFeature.F_PROJECT_ID,


        );
        database.featureDao.insertFeature(feature);
      }
      database.featureDao.countFeatures().then((value) {
        setState(() {
          _featureNo = value;
          final snackBar =
          SnackBar(content: Text('table Features with $_featureNo records'));
          Scaffold.of(context).showSnackBar(snackBar);
        });
      });
    });

    fetchRefFeaturetype().then((value) {
        final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.refFeatureTypeDao.deleteAllRefFeatureType();
      IRefFeatureType iRefFeatureType;
      _reffeaturetypeList  = value;

      for (int i = 0; i <_reffeaturetypeList.length - 1; i++) {
       IRefFeatureType  iFeatureref = _reffeaturetypeList[i];

        RefFeatureType reffeatureType =RefFeatureType(
          F_FEATURE_TYPE: iFeatureref.F_FEATURE_TYPE,
          F_DESCRIPTION: iFeatureref.F_DESCRIPTION,
        );
        database.refFeatureTypeDao.insertRefFeatureType(reffeatureType);
      }
        database.refFeatureTypeDao.countRefFeatureTypes().then((value) {
          setState(() {
            _reffeaturetypeNo = value;
            final snackBar =
            SnackBar(content: Text('table RefFeatureTypes with ${_reffeaturetypeNo}  records'));
            Scaffold.of(context).showSnackBar(snackBar);
          });
        });

    });

    fetchRefFeatureConservation().then((value) {
      final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.refFeatureConservationDao.deleteAllRefFeatureConservation();
      IRefFeatureConservation iRefFeatureConservation;
      _reffeatureconservationList  = value;

      for (int i = 0; i <_reffeatureconservationList.length - 1; i++) {
        IRefFeatureConservation  iFeatureconv = _reffeatureconservationList[i];

        RefFeatureConservation refFeatureConservation = RefFeatureConservation(
          F_FEATURE_CONSERVATION: iFeatureconv.F_FEATURE_CONSERVATION,
          F_DESCRIPTION: iFeatureconv .F_DESCRIPTION,
        );
        database.refFeatureConservationDao.insertRefFeatureConservation(refFeatureConservation);
      }
      database.refFeatureConservationDao.countRefFeatureConservations().then((value) {
        setState(() {
          _reffeatureConservationNo = value;
          final snackBar =
          SnackBar(content: Text('table RefFeatureConservation with ${_reffeatureConservationNo}  records'));
          Scaffold.of(context).showSnackBar(snackBar);
        });
      });

    });

    fetchRefPeriod().then((value) {
      final database = Provider.of<InterrisDatabase>(context, listen: false);
      database.refPeriodDao.deleteAllRefPeriod();
      IRefPeriod iRefPeriod;
      _refperiodList  = value;

      for (int i = 0; i <_refperiodList.length - 1; i++) {
        IRefPeriod  iRefPeriod = _refperiodList[i];

        RefPeriod refperiod =RefPeriod(
          F_PERIOD: iRefPeriod.F_PERIOD,
          F_DESCRIPTION: iRefPeriod.F_DESCRIPTION,
        );
        database.refPeriodDao.insertRefPeriod(refperiod);
      }
      database.refPeriodDao.countRefPeriods().then((value)
      {
        setState(() {
          _refperiodNo = value;
          final snackBar =
          SnackBar(content: Text('table RefFeatureTypes with $_refperiodNo  records'));
          Scaffold.of(context).showSnackBar(snackBar);
        });
      });

    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          height: 230,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: <
              Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text('Connection state : ' + _connectionMsg)),
            _userNo == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Text(
                        'There are no users yet neither a project. Connect to server. '),
                  )
                : Container(
                    width: 0,
                    height: 0,
                  ),
            Row(
              children: [
                SizedBox(
                  width: 15.0,
                ),
                Form(
                  key: _formKey,
                  child: Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: IpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'IP Address',
                          hintText: 'Enter IP Address'),
                      validator: (value) =>
                          value.isEmpty ? 'IP Address  cannot be blank' : null,
                      onSaved: (value) => _IpAdress = value,
                    ),
                  ),
                ),
                RaisedButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text('Connect'),
                    onPressed: () {
                      validateAndSaveProjectAndPersons(context);
                    }),
                SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text('Project: ' + _projectName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ]),
            SizedBox(
              height: 15.0,
            ),
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text('No of users: ' + _userNo.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ]),
          ]),
        ),
        SizedBox(
          height: 50.0,
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          height: 90,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Get tables from connected server :'),
              RaisedButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: _getTablesEnabled
                      ? Text(
                          'Get tables',
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(
                          'Get tables',
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                  onPressed: () {
                    _getTablesEnabled ? getTables(context) : null;
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
