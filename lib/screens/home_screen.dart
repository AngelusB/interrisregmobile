import 'package:flutter/material.dart';
import '../data/moor_database.dart';
import '../librar/library.dart' as lib;
import '../widgets/app_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static SharedPreferences _preferences;
  int _userNo = 0;
  int _unitNo = 0;
  int _planumNo = 0;
  int _featureNo=0;
  String _projectName = '';
  String _projectCode = '';
  var _isInit = true;

  static String getPrefString(SharedPreferences pref, String key,
      {String defValue = ''}) {
    if (pref == null) return defValue;
    return pref.getString(key) ?? defValue;
  }

  Future<void> init() async {
    final database = Provider.of<InterrisDatabase>(context, listen: false);
    try {
      database.userDao.countUsers().then((value) {
        setState(() {
          _userNo = value;
        });
      });

      database.unitDao.countUnits().then((value) {
        setState(() {
          _unitNo = value;
        });
      });

      database.planumDao.countPlanums().then((value) {
        setState(() {
          _planumNo = value;
        });
      });

      database.featureDao.countFeatures().then((value) {
        setState(() {
          _featureNo = value;
        });
      });

      _preferences = await SharedPreferences.getInstance();
      setState(() {
        _projectName = getPrefString(_preferences, lib.PREFS_ProjectName);
        _projectCode = getPrefString(_preferences, lib.PREFS_ProjectCode);
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

  /* @override
  void didChangeDependencies() {
    if (_isInit) {
      print('in didChangeDependencies()');
    }
    _isInit = false;
    super.didChangeDependencies();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interris Registries'),
        actions: [
          PopupMenuButton(
            onSelected: ((_) {}),
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('nader in te vullen '),
              )
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
                Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0, 1],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Project name:',
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Project code:',
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Text(
                      'Persons:',
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Units:',
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Plana:',
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Features:',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      _projectName,
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      _projectCode,
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    _userNo > 0
                        ? Text(
                            '$_userNo',
                            textAlign: TextAlign.end,
                          )
                        : Text(
                            'no users',
                            textAlign: TextAlign.end,
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _unitNo > 0
                        ? Text(
                            '$_unitNo',
                            textAlign: TextAlign.end,
                          )
                        : Text(
                            'no Units',
                            textAlign: TextAlign.end,
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _planumNo > 0
                        ? Text(
                            '$_planumNo',
                            textAlign: TextAlign.end,
                          )
                        : Text(
                            'no Plana',
                            textAlign: TextAlign.end,
                          ),
                    SizedBox(
                      height: 10.0,
                    ),
                    _featureNo > 0
                        ? Text(
                      '$_featureNo',
                      textAlign: TextAlign.end,
                    )
                        : Text(
                      'no Features',
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
