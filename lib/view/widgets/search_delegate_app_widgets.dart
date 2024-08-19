import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:icons_plus/icons_plus.dart';

/*
buscador para toda la app
*/
class SearchDelegateAppWidgets extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar personaje, cómics, etc.';
  @override
  TextStyle? get searchFieldStyle => FontsTypeTheme.typeFont.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w300,
      color: PaletteColorsTheme.secondary);

  @override
  List<Widget>? buildActions(BuildContext context) {
    if (query.isNotEmpty) {
      return [
        IconButton(
            icon: const Icon(Iconsax.trash_outline),
            onPressed: () {
              /*elimina lo buscador */
              query = '';
            }).animate().fade(duration: 300.ms, curve: Curves.bounceIn).scale()
      ];
    } else {
      return [];
    }
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const GradientContainer(
      child: IsEmptyComponents(
        title: 'buildResults',
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const GradientContainer(
      child: IsEmptyComponents(
        title: 'buildSuggestions',
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: PaletteColorsTheme.transparent,
        elevation: 0,
        iconTheme: theme.iconTheme,
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: searchFieldStyle,
          ),
    );
  }
}
