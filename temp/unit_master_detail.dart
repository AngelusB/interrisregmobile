import 'dart:math';
import 'package:flutter/material.dart';
import './unit_detail.dart';
import './unit_list.dart';


class UnitMasterDetailContainer extends StatefulWidget {
 static const String routeName = '/UnitPage';
  @override
  _UnitMasterDetailContainerState createState() =>
      _UnitMasterDetailContainerState();
}

class _UnitMasterDetailContainerState extends State<UnitMasterDetailContainer> {
  static const int kTabletBreakpoint = 500;

  IUnit _selectedItem;
  bool isNewRecord=false;
//=================================P H O N E  ============================
  Widget _buildMobileLayout() {
    return UnitListing(
      itemSelectedCallback: (unit) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) {
              return UnitDetails(
                isInTabletLayout: false,
                unit: unit,
                isNewRecord:false,
              );
            },
          ),
        );
      },
    );
  }
//=================================  T A B L E T  ============================
  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Material(
            elevation: 4.0,
            child: UnitListing(
              isNewItem: isNewRecord,
              itemSelectedCallback: (unit) {
                setState(() {
                  _selectedItem = unit;

                });
              },
              selectedItem: _selectedItem,

            ),

          ),
        ),
        Flexible(
          flex: 3,
          child: UnitDetails(
            isInTabletLayout: true,
            unit: _selectedItem,
            isNewRecord:false ,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < kTabletBreakpoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Units"),
      ),
      drawer: navigationDrawer(),
      body: content,
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Unit nwUnit=Unit(F_UNIT:'',F_REMARK: '');
          isNewRecord=true;
      //  itemSelectedCallback(nwUnit);
        },
        child: Icon(Icons.add, color: Colors.yellow,),
        foregroundColor: Colors.pink,
      ),
    );
  }
}