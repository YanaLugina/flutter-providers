import 'package:flutter/material.dart';
import 'package:flutter_provider_example/count_provider.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'my_count_page.dart';
import 'my_user_page.dart';
import 'user_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyCountProvider>.value(value: MyCountProvider()),
        FutureProvider<List<User>>(
          create: (_) async => UserProvider().loadUserData(),
          initialData: [],
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text("Provider Demo"),
                centerTitle: true,
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.add),),
                    Tab(icon: Icon(Icons.person),),
                    /*Tab(icon: Icon(Icons.message),),*/
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  MyCountPage(),
                  MyUserPage(),
                  /*MyEventPage(),*/
                ],
              ), // This trailing comma makes auto-formatting nicer for build methods.
            )
        ),
      ),
    );
  }
}
