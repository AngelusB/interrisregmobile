import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // dates
import 'package:provider/provider.dart';

import './unit_detail_screen.dart';
import '../data/moor_database.dart';
import '../librar/library.dart' as lib;

class UnitListing extends StatefulWidget {
  static const routeName = '/unitListScreen';


  // final ValueChanged<Unit> itemSelectedCallback;
  final Unit selectedItem = null;
  bool isNewItem;

  @override
  _UnitListingState createState() => _UnitListingState();
}

class _UnitListingState extends State<UnitListing> {
  List<Unit> allUnits = [];
  String _search = "";
  TextEditingController _textController = new TextEditingController();
  int _selectedIndex = 0;

  Icon _getLeadingIcon(Unit unit) {
    if (unit.deleted == true) {
      return Icon(Icons.delete);
    }
    if (unit.changed == true) {
      return Icon(Icons.change_history);
    }
    if (unit.inserted == true) {
      return Icon(Icons.add);
    }
    return null;
  }

  onItemChanged(String value) {
    setState(() {
      _search = value;
    });
  }

  Unit _makeEmptyUnit(){
    Unit unit=Unit(F_UNIT_ID: "",F_UNIT: "",F_REMARK: "",F_PROJECT_ID: "",F_RECORD_TIME: 0,F_RECORDER: "");
    return unit;
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
          'Units',
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Unit newUnit=_makeEmptyUnit();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UnitDetail(
                        unit: newUnit,
                        isNewRecord: true,
                      )));
                },
                child: Icon(
                  Icons.add,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintText: 'Search...',
            ),
            onChanged: onItemChanged,
          ),
        ),
        Expanded(
          child: StreamBuilder(
              stream: db.unitDao.watchAllUnits(_search),
              builder: (context, AsyncSnapshot<List<Unit>> snapshot) {
                allUnits = snapshot.data ?? List();
                return ListView.builder(
                    itemCount: allUnits.length,
                    itemBuilder: (_, index) {
                      final Unit itemUnit = allUnits[index];
                      return Card(
                        color: _selectedIndex != null && _selectedIndex == index
                            ? Colors.black12
                            : Colors.white,
                        child: ListTile(
                          leading: _getLeadingIcon(itemUnit),
                          title: Text(
                            itemUnit.F_UNIT,
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          subtitle: Text(
                            itemUnit.F_RECORDER +
                                ' - ' +
                                formatter.format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        itemUnit.F_RECORD_TIME * 1000)),
                            style: new TextStyle(color: Colors.black),
                          ),
                          trailing: !itemUnit.deleted
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
                                          db.unitDao.updateUnit(
                                              itemUnit.copyWith(deleted: true));
                                        });
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content: Text(itemUnit.F_UNIT +
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
                                      db.unitDao.updateUnit(
                                          itemUnit.copyWith(deleted: false));
                                    });
                                  }),
                          onTap: () {
                            widget.isNewItem = false;
                            _selectedIndex = index;
                            itemUnit.deleted ?
                            Scaffold.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(itemUnit.F_UNIT +
                                        " removed")))
                            :
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UnitDetail(
                                      unit: itemUnit,
                                      isNewRecord: widget.isNewItem,
                                    )));
                          },
                          selected: widget.selectedItem == itemUnit,
                        ),
                      );
                      // );
                    });
              }),
        ),
      ]),
    );
  }
}
