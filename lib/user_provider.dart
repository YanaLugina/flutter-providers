import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/user.dart';

class UserProvider {
  final String _dataPath = 'asserts/user.json';
  List<User> users;
  Future<String> loadAssert() async {
    return await Future.delayed(Duration(seconds: 10),  () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAssert();
    Map<String, dynamic> jsonUserData = jsonDecode(dataString);
    users = UserList.fromJson(jsonUserData['users']).users;
    print('done loading user!' + jsonEncode(users));
    return users;
  }
}