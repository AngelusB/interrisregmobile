import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../data/moor_database.dart';
import 'package:provider/provider.dart';
import '../librar/library.dart' as lib;

class UnitDetails extends StatelessWidget {
  final bool isInTabletLayout;
  final Unit unit;
  final bool isNewRecord;

  UnitDetails({
    @required this.isInTabletLayout,
    @required this.unit,
    @required this.isNewRecord,
  });

//  @override
//  _UnitDetailsState createState() => _UnitDetailsState();
//}

//class _UnitDetailsState extends State<UnitDetails> {

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    TextEditingController _textControllerUnitName =
        TextEditingController(text: unit != null ? unit.F_UNIT : '');
    TextEditingController _textControllerUnitRemark =
        TextEditingController(text: unit != null ? unit.F_REMARK : '');
    final TextTheme textTheme = Theme.of(context).textTheme;
    final db = Provider.of<InterrisDatabase>(context, listen: false);
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.all(12),
            height: 50,
            child: TextFormField(
              controller: _textControllerUnitName,
              decoration: InputDecoration(
                  hintText: 'enter Unit name', labelText: "Unit name"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            )),
        Container(
            padding: EdgeInsets.all(12),
            height: 50,
            child: TextFormField(
              controller: _textControllerUnitRemark,
              decoration: InputDecoration(
                  hintText: 'enter Remark', labelText: "Remark"),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                String projId = lib.currentProjectId;
                db.unitDao.updateUnit(unit.copyWith(
                    F_UNIT: _textControllerUnitName.text,
                    F_REMARK: _textControllerUnitRemark.text,
                    F_RECORD_TIME:
                        DateTime.now().toUtc().millisecondsSinceEpoch,
                    F_PROJECT_ID: projId,
                    changed: true));
                // als test voor een nieuw record
                // String s = lib.getId();
                // If the form is valid, display a Snackbar.
                Scaffold.of(context).showSnackBar(SnackBar(
                    content:
                        Text('Processing Data' + DateTime.now().toString())));
                // _textControllerUnitRemark.text = s;
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );

    if (isInTabletLayout) {
      return Form(key: _formKey, child: content);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(unit.F_UNIT),
      ),
      body: Form(key: _formKey, child: content),
    );
  }
}
