import 'package:flutter/material.dart';
import 'package:flutter_provider_example/count_provider.dart';
import 'package:provider/provider.dart';

class MyCountPage extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    MyCountProvider _state = Provider.of<MyCountProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'ChangeNotifierProvider Example',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            Text(
                '${_state.counterValue}',
              style: Theme.of(context).textTheme.headline4,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    onPressed: () => _state.decrementCount(),
                    color: Colors.red,
                    icon: Icon(Icons.remove)
                ),
                Consumer<MyCountProvider>(
                    builder: (context, value, child) {
                      return IconButton(
                          onPressed: () => value.incrementCount(),
                          color: Colors.green,
                          icon: Icon(Icons.add)
                      );
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

