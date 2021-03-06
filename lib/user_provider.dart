import 'dart:convert';
import 'package:flutter/services.dart';

import 'models/user.dart';
import 'models/user_list.dart';

class UserProvider {
  final String _dataPath = 'assets/users.json';
  late List<User> users;

  Future<String> loadAsset() async {
    return await Future.delayed(Duration(seconds: 2), () async {
      return await rootBundle.loadString(_dataPath);
    });
  }

  Future<List<User>> loadUserData() async {
    var dataString = await loadAsset();
    Map<String, dynamic> jsonUserData = json.decode(dataString);
    this.users = UserList.fromJson(jsonUserData['users']).users;
    // print('done loading user!' + jsonEncode(users));
    return users;
  }
}