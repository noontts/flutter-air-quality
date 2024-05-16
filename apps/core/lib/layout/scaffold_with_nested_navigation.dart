import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});

  void _goBranch(int index) {
    navigationShell.goBranch(index,
        initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: navigationShell,
        bottomNavigationBar: Container(
          color: Colors.white,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 5),
            child: GNav(
              gap: 8,
              color: Colors.black,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.blue,
              padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.roofing_outlined,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.map,
                  text: 'Map',
                )
              ],
              onTabChange: (index) {
                _goBranch(index);
              },
            ),
          ),
        ));
  }
}