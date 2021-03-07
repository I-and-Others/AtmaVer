import 'package:atmaver_demo/Advertisement.dart';
import 'package:flutter/material.dart';

import 'Messages.dart';
import 'Settings.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Advertisement(),
    Messages(),
    Settings(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.only(right: 8.0),
          child: TextField(
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
              hintText: "Ara...",
              hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Color(0xFFEEEEEE),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color(0xFF00adb5),
              elevation: 10,
              child: Text(
                "Filtrele",
                style: TextStyle(
                  color: Color(0xFFEEEEEE),
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF222831),
        unselectedItemColor: Color(0xFFFFFFFF),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'İlanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mesajlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF00adb5),
        onTap: _onItemTapped,
      ),
    );
  }
}
