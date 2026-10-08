import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService  extends ChangeNotifier{

  static init() async{
    _prefs = await SharedPreferences.getInstance();
  }
  static late final SharedPreferences _prefs;
  Future<void> loginUser(String userName) async {
    try {
      _prefs.setString("userName", userName);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logOutUser()  {
    _prefs.clear();
  }

  String? getUserName() {
    return _prefs.getString("userName");

  }

  Future<bool> isLoggedIn() async {
    String? username = await _prefs.getString("userName");
    if(username == null) return false;
    return true;
  }

  void updateUserName(String newName){
    _prefs.setString('userName', newName);
    notifyListeners();
  }
}
