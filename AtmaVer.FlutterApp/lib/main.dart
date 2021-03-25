import 'package:atmaver_real/Layout/StreamLayout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/intro.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var token = preferences.getString('token');
  runApp(MyApp(token: token));
}

class MyApp extends StatefulWidget {
  final String token;

  MyApp({Key key, @required this.token}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState(token);
}

class _MyAppState extends State<MyApp> {
  final String token;

  _MyAppState(this.token);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [MaterialPage(child: token != null ? Layout() : IntroPage())],
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          return true;
        },
      ),
    );
  }
}
