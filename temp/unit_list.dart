import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // dates
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../models/unit.dart';
import '../librar/library.dart' as lib;

class UnitListing extends StatefulWidget {
  UnitListing({
    @required this.itemSelectedCallback,
    this.selectedItem,
    this.isNewItem,
  });

  final ValueChanged<IUnit> itemSelectedCallback;
  final IUnit selectedItem;
  bool isNewItem;

  @override
  _UnitListingState createState() => _UnitListingState();
}

class _UnitListingState extends State<UnitListing> {
  List<IUnit> allUnits = [];
  String _search = "";
  TextEditingController _textController = new TextEditingController();
  int _selectedIndex = 0;

  Icon getTrailingIcon(IUnit unit) {
    if (unit.deleted == true) {
      return Icon(Icons.delete);
    }
    if (unit.changed == true) {
      return Icon(Icons.change_history);
    }
    if (unit.inserted == true) {
      return Icon(Icons.input);
    }
    return null;
  }

  onItemChanged(String value) {
    setState(() {
      _search = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return Column(children: [
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
            // TODO stream: db.unitDao.watchAllUnits(_search),
            stream: db.unitDao.watchAllUnits(_search),
            builder: (context, AsyncSnapshot<List<Unit>> snapshot) {
              allUnits = snapshot.data ?? List();
              return ListView.builder(
                  itemCount: allUnits.length,
                  itemBuilder: (_, index) {
                    final Unit itemUnit = allUnits[index];
                    return Dismissible(
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return lib.AlertDialog();
                          },
                        );
                      },
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          db.unitDao
                              .updateUnit(itemUnit.copyWith(deleted: true));
                        });
                        Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(itemUnit.F_UNIT + " removed")));
                      },
                      child: Container(
                          padding: EdgeInsets.all(3),
                          height: 70,
                          child: Card(
                            color: _selectedIndex != null &&
                                    _selectedIndex == index
                                ? Colors.black12
                                : Colors.white,
                            child: ListTile(
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
                              trailing: getTrailingIcon(itemUnit),
                              onTap: () {
                                widget.isNewItem = false;
                                widget.itemSelectedCallback(itemUnit);
                                _selectedIndex = index;
                              },
                              selected: widget.selectedItem == itemUnit,
                            ),
                          )),
                    );
                  });
            }),
      ),
    ]);
  }
}
