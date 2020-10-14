import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // dates
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import './planum_detail_screen.dart';
import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class PlanumListing extends StatefulWidget {
  static const routeName = '/planumListScreen';

  // final ValueChanged<Unit> itemSelectedCallback;
  final Planum selectedItem = null;
  bool isNewItem;

  @override
  _PlanumListingState createState() => _PlanumListingState();
}

class _PlanumListingState extends State<PlanumListing> {
  List<Planum> allPlana = [];
  List<Unit> allUnits = [];
  List<DropdownMenuItem<Unit>> _items = [];

  Unit _selectedUnit;
  String _unitName = "";
  TextEditingController _textController = new TextEditingController();
  int _selectedIndex = 0;
  bool _firstUnit;
  bool _enableAdd=false;

  Icon _getLeadingIcon(Planum planum) {
    if (planum.deleted == true) {
      return Icon(Icons.delete);
    }
    if (planum.changed == true) {
      return Icon(Icons.change_history);
    }
    if (planum.inserted == true) {
      return Icon(Icons.add);
    }
    return null;
  }

  Planum _makeEmptyPlanum() {
    Planum planum = Planum(
        F_UNIT_ID: "",
        F_PLANUM_ID: "",
        F_PLANUM_TYPE: "Planum", //may not be emty
        F_BEGIN_DATE: "",
        F_END_DATE: "",
        F_PLANUM: "",
        F_REMARK: "",
        F_PROJECT_ID: "",
        F_RECORD_TIME: 0,
        F_RECORDER: "");
    return planum;
  }

  void _setUnitName(UnitDao dao, String unitId) {
    dao.getUnit(unitId).then((value) {
      setState(() {
        _unitName = value.F_UNIT;
      });
    });
  }

  Widget _buildUnitSelector(UnitDao dao, BuildContext ctx) {
    return new Center(
        child: FutureBuilder(
            future: dao.getAllUnitsOrdered(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                allUnits = snapshot.data;

                return SearchableDropdown.single(
                  items:
                      snapshot.data.map<DropdownMenuItem<Unit>>((Unit value) {
                    return DropdownMenuItem<Unit>(
                      value: value,
                      child: Text(value.F_UNIT),
                    );
                  }).toList(),
                  value: _selectedUnit,
                  hint: "Select a Unit",
                  searchHint: "Select a Unit",
                  onChanged: (value) {
                    setState(() {
                      _selectedUnit = value;
                    });
                  },
                  isExpanded: true,
                );
              } else
                return CircularProgressIndicator();
            }));
  }

  @override
  void initState() {
    _firstUnit = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final db = Provider.of<InterrisDatabase>(context, listen: false);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Plana',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          _selectedUnit != null ?
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Planum newPlanum = _makeEmptyPlanum();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PlanumDetail(
                        planum: newPlanum,
                        unit: _selectedUnit,
                        isNewRecord: true,
                      )));

                },
                child: Icon(
                  Icons.add,
                  size: 26.0,
                ),
              ))
          :Container(),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: _buildUnitSelector(db.unitDao, context),
        ),
        Expanded(
          child: _selectedUnit != null
              ? StreamBuilder(
                  stream: db.planumDao.watchAllPlanaFromUnit(_selectedUnit),
                  builder: (context, AsyncSnapshot<List<Planum>> snapshot) {
                    allPlana = snapshot.data ?? List();
                    return ListView.builder(
                        itemCount: allPlana.length,
                        itemBuilder: (_, index) {
                          final Planum itemPlanum = allPlana[index];
                          // _setUnitName(db.unitDao,  itemPlanum.F_UNIT_ID);
                          return Card(
                            color: _selectedIndex != null &&
                                    _selectedIndex == index
                                ? Colors.black12
                                : Colors.white,
                            child: ListTile(
                              leading: _getLeadingIcon(itemPlanum),
                              title: Text(
                                itemPlanum.F_PLANUM,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              subtitle: Text(
                                itemPlanum.F_PLANUM +
                                    ' ' +
                                    itemPlanum.F_RECORDER +
                                    ' - ' +
                                    formatter.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            itemPlanum.F_RECORD_TIME * 1000)),
                                style: new TextStyle(color: Colors.black),
                              ),
                              trailing: !itemPlanum.deleted
                                  ? IconButton(
                                      icon: new Icon(Icons.delete),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return lib.AlertDialog();
                                          },
                                        ).then((value) {
                                          if (value == true) {
                                            setState(() {
                                              db.planumDao.updatePlanum(
                                                  itemPlanum.copyWith(
                                                      deleted: true));
                                            });
                                            Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                    content: Text(
                                                        itemPlanum.F_PLANUM +
                                                            " removed")));
                                          } else {
                                            print('alert false');
                                          }
                                        });
                                      },
                                    )
                                  : IconButton(
                                      icon: new Icon(Icons.undo),
                                      onPressed: () {
                                        setState(() {
                                          db.planumDao.updatePlanum(itemPlanum
                                              .copyWith(deleted: false));
                                        });
                                      }),
                              onTap: () {
                                widget.isNewItem = false;
                                _selectedIndex = index;
                                if (itemPlanum.deleted == true) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text(
                                          itemPlanum.F_PLANUM + " removed")));
                                }

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PlanumDetail(
                                          unit:_selectedUnit,
                                          planum: itemPlanum,
                                          isNewRecord: widget.isNewItem,
                                        )));
                              },
                              selected: widget.selectedItem == itemPlanum,
                            ),
                          );
                          // );
                        });
                  })
              : Container(),
        ),
      ]),
    );
  }
}
