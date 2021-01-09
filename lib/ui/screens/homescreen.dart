import 'package:flutter/material.dart';
import 'package:greenz_go_app_v2/ui/screens/catalog_screen.dart';
import 'package:greenz_go_app_v2/ui/screens/login_screen.dart';
import 'package:greenz_go_app_v2/ui/screens/profile_screen.dart';
import 'package:greenz_go_app_v2/ui/screens/search_screen.dart';
import 'package:greenz_go_app_v2/notifier/auth_notifier.dart';
import 'package:provider/provider.dart';

//TODO: #1.1 Make Navigation bar work - update so that the navigation bar stays when you navigate to new screens

//This file controls the bottom navigation bar

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  PageController _pageController = PageController();
  final List<Widget> _screens = [
    SearchScreen(),
    CatalogScreen(),
    Consumer<AuthNotifier>(
      builder: (context, notifier, child) {
        return notifier.user != null ? ProfileScreen() : LoginScreen();
      },
    ),
  ];
  void _onPageChange(int index) {}

  void _onItemTapped(int selectedPage) {
    setState(() {
      _pageController.jumpToPage(selectedPage);
      _selectedIndex = selectedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChange,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.move_to_inbox,
              ),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.perm_identity,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
