import 'user.dart';

class UserList {
  List<User> users;
  UserList(this.users);

  UserList.fromJson(List<dynamic> usersJson)
  : users = usersJson.map((user) => User.fromJson(user)).toList();
}