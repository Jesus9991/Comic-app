import 'package:comic_app/controller/exports/exports.dart';
import 'package:flutter/material.dart';

/*
loading para la app
*/
class LoadingAppComponents extends StatelessWidget {
  const LoadingAppComponents({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: PaletteColorsTheme.greyBlackTwo,
        valueColor: AlwaysStoppedAnimation(PaletteColorsTheme.secondary),
      ),
    );
  }
}
