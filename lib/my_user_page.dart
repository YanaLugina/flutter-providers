import 'package:flutter/material.dart';

class MyUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'FutureProvider Example, users loadedfrom a file',
            style: TextStyle(
              fontSize: 60
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  color: Colors.grey[(index * 200) % 400],
                  child: Center(
                    child: Text('TEST WIDGET'),
                  ),
                );
              }
          )
        ),
      ],
    );
  }
}