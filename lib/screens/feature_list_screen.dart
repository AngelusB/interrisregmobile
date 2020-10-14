import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // dates
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import './feature_detail_screen.dart';
import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class FeatureListing extends StatefulWidget {
  static const routeName = '/featureListScreen';


  final Feature selectedItem = null;
  bool isNewItem;

  @override
  _FeatureListingState createState() => _FeatureListingState();
}

class _FeatureListingState extends State<FeatureListing> {
  List<Feature> allFeature = [];
  List<Unit> allUnits = [];
  List<DropdownMenuItem<Unit>> _items = [];

  Unit _selectedUnit;
  String _unitName = "";
  TextEditingController _textController = new TextEditingController();
  int _selectedIndex = 0;

  bool _enableAdd=false;

  Icon _getLeadingIcon(Feature feature) {
    if (feature.deleted == true) {
      return Icon(Icons.delete);
    }
    if (feature.changed == true) {
      return Icon(Icons.change_history);
    }
    if (feature.inserted == true) {
      return Icon(Icons.add);
    }
    return null;
  }

  Feature _makeEmptyFeature() {

    Feature feature = Feature(
        F_FEATURE_ID: "",
        F_UNIT_ID: "",
        F_FEATURE:"",
        F_FEATURE_TYPE: "matrix", //may not be emty
        F_DATE_BEGIN: 0,
        F_DATE_END: 0,
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
    return feature;
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
 //   _firstUnit = true;
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
          'Feature',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          _selectedUnit != null ?
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  /*
                  Feature newFeature = _makeEmptyFeature();

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FeatureDetail(
                        feature: newFeature,
                        unit: _selectedUnit,
                        isNewRecord: true,
                      )));

                   */

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
              stream: db.featureDao.watchAllFeaturesFromUnit(_selectedUnit),
              builder: (context, AsyncSnapshot<List<Feature>> snapshot) {
                allFeature = snapshot.data ?? List();
                return ListView.builder(
                    itemCount: allFeature.length,
                    itemBuilder: (_, index) {
                      final Feature itemFeature = allFeature[index];
                      // _setUnitName(db.unitDao,  itemFeature.F_UNIT_ID);
                      return Card(
                        color: _selectedIndex != null &&
                            _selectedIndex == index
                            ? Colors.black12
                            : Colors.white,
                        child: ListTile(
                          leading: _getLeadingIcon(itemFeature),
                          title: Text(
                            itemFeature.F_FEATURE,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            itemFeature.F_FEATURE_TYPE +
                                ' ' +
                                itemFeature.F_RECORDER +
                                ' - ' +
                                formatter.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        itemFeature.F_RECORD_TIME * 1000)),
                            style: new TextStyle(color: Colors.black),
                          ),
                          trailing: !itemFeature.deleted
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
                                    db.featureDao.updateFeature(
                                        itemFeature.copyWith(
                                            deleted: true));
                                  });
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              itemFeature.F_FEATURE +
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
                                  db.featureDao.updateFeature(itemFeature
                                      .copyWith(deleted: false));
                                });
                              }),
                          onTap: () {
                            widget.isNewItem = false;
                            _selectedIndex = index;
                            if (itemFeature.deleted == true) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      itemFeature.F_FEATURE + " removed")));
                            }

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FeatureDetail(
                                  unit:_selectedUnit,
                                  feature: itemFeature,
                                  isNewRecord: widget.isNewItem,
                                )));

                          },
                          selected: widget.selectedItem == itemFeature,
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
