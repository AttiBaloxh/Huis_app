import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/home_page/home_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/home_icon.svg",
              color: _selectedIndex == 0 ? kPinkColor : kBlack,
            ),
            label: _selectedIndex == 0 ? '•' : "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/automation_icon.svg",
              color: _selectedIndex == 1 ? kPinkColor : kBlack,
            ),
            label: _selectedIndex == 1 ? '•' : '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/electric_icon.svg",
              color: _selectedIndex == 2 ? kPinkColor : kBlack,
            ),
            label: _selectedIndex == 2 ? '•' : '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/setting_icon.svg",
              color: _selectedIndex == 3 ? kPinkColor : kBlack,
            ),
            label: _selectedIndex == 3 ? '•' : '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: kPinkColor,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
