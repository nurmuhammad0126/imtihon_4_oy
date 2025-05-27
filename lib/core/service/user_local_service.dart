import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/auth/data/model/user_model.dart';

class UserLocalService {
  static const _userKey = 'user_data';
  static const _userId = 'user_id';


  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(user.toJson());
    await prefs.setString(_userKey, jsonString);
    await prefs.setString(_userId, user.id??"");
  }
  Future<String?> getUserId()async{
    final prefs = await SharedPreferences.getInstance();
    return  prefs.getString(_userId);
  }
  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_userKey);

    if (jsonString == null) return null;

    final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
    return UserModel.fromJson(jsonMap["id"],jsonMap);
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<bool> hasUser() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userKey);
  }


}
