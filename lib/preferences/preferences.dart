import 'package:shared_preferences/shared_preferences.dart'; 
class Preferences {
  static late SharedPreferences _prefs; 

  static String _username = "";
  static String _password = ""; 

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get username {
    return _prefs.getString(_username) ?? _username;
  }

  static set username(String value) {
    _username = value;
    _prefs.setString('username', _username);
  }
  static String get password {
    return _prefs.getString(_password) ?? _password;
  }

  static set password(String value) {
    _password = value;
    _prefs.setString('password', _password);
  }

}