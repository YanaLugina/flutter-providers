import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'FutureProvider Example, users loaded from a file',
            style: TextStyle(
              fontSize: 17
            ),
          ),
        ),
        Consumer<List<User>>(
          builder: (context, List<User> users, _) {
            return users.length == 0 ? Text('User Empty')
                :Expanded(
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 50.0,
                        color: Colors.grey[(index * 200) % 400],
                        child: Center(
                          child: Text(
                              'User ${users[index].firstName} ${users[index].lastName}'
                          ),
                        ),
                      );
                    }
                ),
            );
          },
        ),
      ],
    );
  }
}