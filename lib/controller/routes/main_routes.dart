import 'package:comic_app/controller/exports/screen_exports.dart';
import 'package:flutter/material.dart';
/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const initialRoute = '/nav_bar_route';
  static const homeRoute = '/home_route';
  static const charactersRoute = '/characters_route';
  static const profileRoute = '/profile_route';
  static const allComicsRoute = '/all_comics_route';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    initialRoute: (_) => const NavBarAppScreenWidgets(),
    //home
    homeRoute: (_) => const HomeAppScreen(),
    charactersRoute: (_) => const CharactersAppScreen(),
    profileRoute: (_) => const ProfileAppScreen(),
    allComicsRoute: (_) => const AllComicsRecentScreen(),
  };
}
