import 'package:flutter/material.dart';
import 'package:interrisregmobile/screens/planum_list_screen.dart';

import '../screens/home_screen.dart';
import '../screens/project_users_screen.dart';
import '../screens/unit_list_screen.dart';
import '../screens/feature_list_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Interris Registries'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.query_builder),
            title: Text('Connect - get from server'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(GetProjectAndUsersScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Units'),
            onTap: () {
              Navigator.of(context).pushNamed(UnitListing.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Plana'),
            onTap: () {
              Navigator.of(context).pushNamed(PlanumListing.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add_location_rounded),
            title: Text('Features'),
            onTap: () {
              Navigator.of(context).pushNamed(FeatureListing.routeName);
            },
          ),
        ],
      ),
    );
  }
}
