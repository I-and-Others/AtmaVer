import 'package:atmaver_real/components/FilterPage.dart';
import 'package:atmaver_real/components/Messages.dart';
import 'package:atmaver_real/components/Settings.dart';
import 'package:atmaver_real/components/StreamPage.dart';
import 'package:atmaver_real/components/Trade.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    StreamPage(),
    TradePage(),
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
        // automaticallyImplyLeading: false,
        title: Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            height: 40.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(fontSize: 18.0, color: Colors.white),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
              iconSize: 26.0,
              icon: const Icon(Icons.filter_list_alt),
              tooltip: 'Filter',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterPage()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Color(0xFF222831),
        // unselectedItemColor: Color(0xFFFFFFFF),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Ads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reduce_capacity_outlined),
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        // selectedItemColor: Color(0xFF00adb5),
        onTap: _onItemTapped,
      ),
    );
  }
}
