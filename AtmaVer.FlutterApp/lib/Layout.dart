import 'package:atmaver_demo/Advertisement.dart';
import 'package:flutter/material.dart';

import 'Trade.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Advertisement(),
    Trade(),
    Text(
      'Index 2: School',
    ),
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
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 34, 40, 49),
              ),
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Color.fromARGB(255, 34, 40, 49),
              elevation: 10,
              child: Text(
                "Filtrele",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explicit_sharp),
            label: 'Takas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
