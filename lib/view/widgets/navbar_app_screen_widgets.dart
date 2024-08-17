import 'dart:ui';

import 'package:comic_app/controller/exports/exports.dart';
import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

/*
nav bar de navegación para el home de la app
*/
class NavBarAppScreenWidgets extends StatefulWidget {
  const NavBarAppScreenWidgets({super.key});

  @override
  State<NavBarAppScreenWidgets> createState() => _NavBarAppScreenWidgetsState();
}

class _NavBarAppScreenWidgetsState extends State<NavBarAppScreenWidgets> {
  int indexSelectScreen = 0;

  List<Widget> screenApp = [
    const HomeAppScreen(),
    const CharactersAppScreen(),
    const ProfileAppScreen(),
  ];

  void onTapped(int index) {
    setState(() {
      indexSelectScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: BottomNavigationBar(
            currentIndex: indexSelectScreen,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
            selectedItemColor: PaletteColorsTheme.secondary,
            unselectedItemColor: PaletteColorsTheme.terteary,
            iconSize: 26,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            enableFeedback: true,
            onTap: (value) {
              onTapped(value);
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Inicio',
                icon: Icon(Iconsax.home_2_outline),
                activeIcon: Icon(Iconsax.home_2_bold),
              ),
              BottomNavigationBarItem(
                label: 'Personajes',
                icon: Icon(Iconsax.category_outline),
                activeIcon: Icon(Iconsax.category_bold),
              ),
              BottomNavigationBarItem(
                label: 'Perfil',
                icon: Icon(Iconsax.profile_2user_outline),
                activeIcon: Icon(Iconsax.profile_2user_bold),
              ),
            ],
          ),
        ),
      ),
      body: screenApp[indexSelectScreen],
    );
  }
}
