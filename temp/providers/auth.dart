import 'dart:convert';
import 'dart:async';

import '../data/moor_database.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class Auth with ChangeNotifier {

  String _userId;
  Timer _authTimer;
  bool _authOk=false;

  bool get isAuth {
    return _authOk;
  }



  Future<void> _authenticate(
      String loginName, String password) async {
       final db = Provider.of<InterrisDatabase>(context, listen: false);
       ////db.userDao.countUsers().then((value) => _countUsers = value);
        db.userDao.passwordOfName(loginName).then((value)=>_authOk=User(value).F_PASSWORD.toLowerCase()==
            password.toLowerCase();
        )





    //  prefs.setString('userData', userData);
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String loginName, String password) async {
    return _authenticate(loginName, password, 'verifyPassword');
  }
/*
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }
*/

}
