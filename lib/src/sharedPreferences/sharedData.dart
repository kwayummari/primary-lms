import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  Future setData(username, phone, role_id, id) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('username', username.toString());
    sharedPreferences.setString('phone', phone.toString());
    sharedPreferences.setString('role_id', role_id.toString());
    sharedPreferences.setString('user_id', id.toString());
  }
  Future getData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var username = sharedPreferences.getString('username');
    var phone = sharedPreferences.getString('phone');
    var role_id = sharedPreferences.getString('role_id');
    var user_id = sharedPreferences.getString('user_id');
    return {
      'username': username,
      'phone': phone,
      'role_id': role_id,
      'user_id': user_id,
    };
  }
}