import 'package:flutter/material.dart';
import 'package:my_kid/presantation/screens/home_screen.dart';
import 'package:my_kid/presantation/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen>{
  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  void _onItemTapped(int index)
  {
    setState(() {
       _selectedIndex = index;
       _pageController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.easeInCirc);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       onTap: _onItemTapped,currentIndex: _selectedIndex
        ,items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: "")]),
    );
  }

}